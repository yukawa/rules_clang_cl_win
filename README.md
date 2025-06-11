<!--
SPDX-FileCopyrightText: Yohei Yukawa
SPDX-License-Identifier: BSD-3-Clause
-->
`rules_clang_cl_win`
===================================

A sample repository to use `clang-cl` to build C++ code with Bazel on Windows.

## To build with `clang-cl.exe`
```
bazelisk run main --extra_execution_platforms=//:host-windows-clang-cl
```

## To build with `cl.exe`
```
bazelisk run main
```
