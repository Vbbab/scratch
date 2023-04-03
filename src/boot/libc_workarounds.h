// A few small workarounds for assumably problematic
// libc functions.
#define strcpy strcpy_
#define memcpy memcpy_
#define strcmp strcmp_
#define strlen strlen_

/**
  * WARNING: Return type not up to spec.
*/
char* strcpy_(char* to, const char* from) {
    char cur = 0;
    while ((cur = (*from++))) *to++ = cur;
    *to++ = 0;
    return to;
}

/**
  * WARNING: Return type not up to spec.
*/
void* memcpy_(void* dst, const void* src, unsigned long n) {
  while (n) {
    *(char*)dst++ = *(char*)src++;
    n--;
  }
  return dst;
}

int strcmp_(const char* s1, const char* s2) {
  while (*s1 && (*s1 == *s2)) s1++, s2++;
  return *(const unsigned char*)s1 - *(const unsigned char*)s2;
}

unsigned long strlen_(const char* str) {
  unsigned long rv = 0;
  while (*str++) rv++;
  return rv;
}