#include "vdt/vdt.hpp"

auto main() -> int
{
  auto const result = name();

  return result == "vdt" ? 0 : 1;
}
