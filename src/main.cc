// SPDX-FileCopyrightText: Yohei Yukawa
// SPDX-License-Identifier: BSD-3-Clause

#include <iostream>
#include <windows.h>

int main() {
#if defined(__clang__)
    std::cout << "The compiler is Clang." << std::endl;
    ::OutputDebugStringA("Hello from Clang!\n");
#elif defined(_MSC_VER)
    std::cout << "The compiler is MSVC." << std::endl;
#else
    std::cout << "The compiler is neither Clang nor MSVC." << std::endl;
#endif
    return 0;
}
