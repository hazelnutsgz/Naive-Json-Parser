#include "naivejson.h"
#include <assert.h> /* assert() */
#include <stdio.h>
#include <stdlib.h> /* NULL, malloc(), realloc(), free(), strtod() */
#include <string.h> /* memcpy() */
#include <errno.h>  /* errno, ERANGE */
#include <math.h>  /* HUGE_VAL */


#ifndef NAIVE_PARSE_STACK_INIT_SIZE
#define NAIVE_PARSE_STACK_INIT_SIZE 256
#endif

#define ISDIGIT(ch) ((ch) >= '0' && (ch) <= '9')
#define ISDIGIT1TO9(ch) ((ch) >= '1' && (ch) <= '9')
#define PUTC(c, ch) do {*(char*) naive_context_push(c, sizeof(char)) = (ch);} while(0)

#define EXPECT(c, ch) do { assert(*c->json ==(ch)); c->json++; } while(0)

void naive_init(naive_value* v) {
    v->type = NAIVE_NULL;
}

static void* naive_context_push(naive_context* c, size_t size) {
    void* ret;
    assert(size > 0);
    if (c->top + size >= c->size) {
        if (c->size == 0)
            c->size = NAIVE_PARSE_STACK_INIT_SIZE;
        while (c->top + size >= c->size)
            c->size += c->size >> 1;  /* c->size * 1.5 */
        c->stack = (char*)realloc(c->stack, c->size);
    }
    ret = c->stack + c->top;
    c->top += size;
    return ret;
}

static void* naive_context_pop(naive_context*c, size_t size) {
    assert(c->top >= size);
    c->top -= size;
    return c->stack + (c->top);
}


static void naive_parse_whitespace(naive_context* c) {
    const char *p = c->json;
    while(*p == ' ' || *p == '\t' || *p == '\n' || *p == '\r')
        p++;
    c->json =p;
}


static int naive_parse_literal(naive_context* c, naive_value* v, const char* literal, naive_type type) {
    size_t  i;
    EXPECT(c, literal[0]);
    for(i = 0; literal[i + 1]; i++)
        if (c->json[i] != literal[i+1])
            return NAIVE_PARSE_INVALID_VALUE;
    c->json += i;
    v->type = type;
    return NAIVE_PARSE_OK;
}

static naive_type naive_parse_null(naive_context* c, naive_value* v) {
    EXPECT(c, 'n');
    if (c->json[0] != 'u' || c->json[1] != 'l' || c->json[2] != 'l')
        return NAIVE_PARSE_INVALID_VALUE;

    c->json += 3;
    v->type = NAIVE_NULL;

    return NAIVE_PARSE_OK;
}

static naive_type naive_parse_value(naive_context* c, naive_value* v) {
    switch (*(c->json)) {
        case 't':   return naive_parse_true(c, v);
        case 'f':   return naive_parse_false(c, v);
        case 'n':   return naive_parse_null(c, v);
        case '"':   return naive_parse_string(c, v);
        case '\0':  return NAIVE_PARSE_EXPECT_VALUE;
        default:    return naive_parse_number(c, v);
    }
}

static int naive_parse_true(naive_context* c, naive_value* v) {
    EXPECT(c, 't');
    if (c->json[0] != 'r' || c->json[1] != 'u' || c->json[2] != 'e')
        return NAIVE_PARSE_INVALID_VALUE;
    c->json += 3;
    v->type = NAIVE_TRUE;
    return NAIVE_PARSE_OK;
}

static int naive_parse_false(naive_context* c, naive_value* v) {
    EXPECT(c, 'f');
    if (c->json[0] != 'a' || c->json[1] != 'l' || c->json[2] != 's' || c->json[3] != 'e')
        return NAIVE_PARSE_INVALID_VALUE;
    c->json += 4;
    v->type = NAIVE_FALSE;
    return NAIVE_PARSE_OK;
}

static int naive_parse_number(naive_context* c, naive_value* v) {
    const char* p = c->json;
    if (*p == '-')  p++;

    if (*p == '0') p++;
    else {
        if (!ISDIGIT1TO9(*p)) return NAIVE_PARSE_INVALID_VALUE;
        for (p++; ISDIGIT(*p); p++);
    }

    if (*p == '.') {
        p++;
        if (!ISDIGIT(*p)) return NAIVE_PARSE_INVALID_VALUE;
        for (p++; ISDIGIT(*p); p++);
    }
    errno = 0;
    v->u.n = strtod(c->json, NULL);
    if (errno == ERANGE && (v->u.n == HUGE_VAL || v->u.n == -HUGE_VAL))
        return NAIVE_PARSE_NUMBER_TOO_BIG;
    v->type = NAIVE_NUMBER;
    c->json = p;
    return NAIVE_PARSE_OK;
}

static int naive_parse_string(naive_context* c, naive_value* v) {
    size_t head = c->top, len;
    const char* p;
    EXPECT(c, '\"');
    p = c->json;
    for(;;) {
        char ch = *p;
        p += 1;
        switch(ch) {
            case '\"':
                len = c->top - head;
                naive_set_string(v, (const char*)naive_context_pop(c, len),len);
                c->json = p;
                return NAIVE_PARSE_OK;
            case '\0':
                c->top = head;
                return NAIVE_PARSE_MISS_QUOTATION_MARK;
            default:
                PUTC(c, ch);
        }
    }
}




naive_type naive_parse(naive_value* v, const char* json) {
    naive_context c;
    int ret;
    assert(v != NULL);
    c.json = json;
    c.stack = NULL;
    c.size = c.top = 0;
    naive_init(v);
    naive_parse_whitespace(&c);
    if ((ret = naive_parse_value(&c, v)) == NAIVE_PARSE_OK) {
        naive_parse_whitespace(&c);
        if (*c.json != '\0') {
            v->type = NAIVE_NULL;
            ret = NAIVE_PARSE_ROOT_NOT_SINGULAR;
        }
    }
    assert(c.top == 0);
    free(c.stack);
    return ret;
}

naive_type naive_get_type(const naive_value* v) {
    assert(v != NULL);
    return v->type;
}

double naive_get_number(const naive_value *v) {
    assert(v != NULL && v->type == NAIVE_NUMBER);
    return v->u.n;
}

void naive_set_string(naive_value* v, const char* s, size_t len){
    assert(v != NULL && (s != NULL || len == 0));
    naive_free(v);
    v->u.s.s = (char* )malloc(len+1);
    memcpy(v->u.s.s, s, len);
    v->u.s.s[len] = '\0';
    v->u.s.len = len;
    v->type = NAIVE_STRING;
}

const char* naive_get_string(const naive_value* v) {
    assert(v != NULL && v->type == NAIVE_STRING);
    return v->u.s.s;
}

size_t naive_get_string_length(const naive_value* v) {
    assert(v != NULL && v->type == NAIVE_STRING);
    return v->u.s.len;
}



void naive_free(naive_value* v) {
    assert(v != NULL);
    if (v->type == NAIVE_STRING)
        free(v->u.s.s);
    v->type = NAIVE_NULL;
}