#include <stdio.h>
#include <uuid/uuid.h>

int main() {
  uuid_t uuid;
  uuid_generate(uuid);
  printf("%s\n", uuid);
}
