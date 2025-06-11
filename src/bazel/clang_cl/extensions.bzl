# SPDX-FileCopyrightText: Yohei Yukawa
# SPDX-License-Identifier: BSD-3-Clause

BUILD_CONTENT = """

load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@rules_cc//cc:cc_library.bzl", "cc_library")
load("@rules_cc//cc/toolchains:cc_toolchain.bzl", "cc_toolchain")
load(":windows_cc_toolchain_config.bzl", "cc_toolchain_config")

package(default_visibility = ["//:__subpackages__"])

cc_library(name = "empty_lib")

filegroup(
    name = "empty",
    srcs = [],
)

cc_toolchain(
    name = "cc-compiler-x64_windows-clang-cl",
    toolchain_identifier = "clang_cl_x64",
    toolchain_config = ":clang_cl_x64",
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
)

cc_toolchain_config(
    name = "clang_cl_x64",
    cpu = "x64_windows",
    compiler = "clang-cl",
    host_system_name = "local",
    target_system_name = "x86_64-pc-windows-msvc",
    target_libc = "msvcrt",
    abi_version = "local",
    abi_libc_version = "local",
    toolchain_identifier = "clang_cl_x64",
    msvc_env_tmp = "%{{temp_dir}}",
    msvc_env_path = "%{{msvc_env_path_x64}}",
    msvc_env_include = "%{{msvc_env_include_x64}}",
    msvc_env_lib = "%{{msvc_env_lib_x64}}",
    cxx_builtin_include_directories = [
        %{{msvc_env_include_array_x64}}
    ],
    tool_paths = {
        "ar": "%{{llvm_path}}/bin/llvm-lib.exe",
        "ml": "%{{llvm_path}}/bin/clang-cl.exe",
        "cpp": "%{{llvm_path}}/bin/clang-cl.exe",
        "gcc": "%{{llvm_path}}/bin/clang-cl.exe",
        "gcov": "wrapper/bin/msvc_nop.bat",
        "ld": "%{{llvm_path}}/bin/lld-link.exe",
        "nm": "%{{llvm_path}}/bin/llvm-nm.exe",
        "objcopy": "wrapper/bin/msvc_nop.bat",
        "objdump": "wrapper/bin/msvc_nop.bat",
        "strip": "wrapper/bin/msvc_nop.bat",
    },
    default_archiver_flags = ["/MACHINE:X64"],
    default_link_flags = ["/MACHINE:X64"],
)

toolchain(
    name = "cc-toolchain-x64_windows-clang-cl",
    exec_compatible_with = [
        "@platforms//os:windows",
#        "@bazel_tools//tools/cpp:clang-cl",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_64",
        "@platforms//os:windows",
    ],
    toolchain = ":cc-compiler-x64_windows-clang-cl",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain(
    name = "cc-compiler-x64_x86_windows-clang-cl",
    toolchain_identifier = "clang_cl_x64_x86",
    toolchain_config = ":clang_cl_x64_x86",
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
)

cc_toolchain_config(
    name = "clang_cl_x64_x86",
    cpu = "x64_x86_windows",
    compiler = "clang-cl",
    host_system_name = "local",
    target_system_name = "i686-pc-windows-msvc",
    target_libc = "msvcrt",
    abi_version = "local",
    abi_libc_version = "local",
    toolchain_identifier = "clang_cl_x64_x86",
    msvc_env_tmp = "%{{temp_dir}}",
    msvc_env_path = "%{{msvc_env_path_x86}}",
    msvc_env_include = "%{{msvc_env_include_x86}}",
    msvc_env_lib = "%{{msvc_env_lib_x86}}",
    cxx_builtin_include_directories = [
        %{{msvc_env_include_array_x86}}
    ],
    tool_paths = {
        "ar": "%{{llvm_path}}/bin/llvm-lib.exe",
        "ml": "%{{llvm_path}}/bin/clang-cl.exe",
        "cpp": "%{{llvm_path}}/bin/clang-cl.exe",
        "gcc": "%{{llvm_path}}/bin/clang-cl.exe",
        "gcov": "wrapper/bin/msvc_nop.bat",
        "ld": "%{{llvm_path}}/bin/lld-link.exe",
        "nm": "%{{llvm_path}}/bin/llvm-nm.exe",
        "objcopy": "wrapper/bin/msvc_nop.bat",
        "objdump": "wrapper/bin/msvc_nop.bat",
        "strip": "wrapper/bin/msvc_nop.bat",
    },
    default_archiver_flags = ["/MACHINE:X86"],
    default_link_flags = ["/MACHINE:X86"],
)

toolchain(
    name = "cc-toolchain-x64_x86_windows-clang-cl",
    exec_compatible_with = [
        "@platforms//os:windows",
#        "@bazel_tools//tools/cpp:clang-cl",
    ],
    target_compatible_with = [
        "@platforms//cpu:x86_32",
        "@platforms//os:windows",
    ],
    toolchain = ":cc-compiler-x64_x86_windows-clang-cl",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

cc_toolchain(
    name = "cc-compiler-arm64_windows-clang-cl",
    toolchain_identifier = "clang_cl_arm64",
    toolchain_config = ":clang_cl_arm64",
    all_files = ":empty",
    ar_files = ":empty",
    as_files = ":empty",
    compiler_files = ":empty",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 1,
)

cc_toolchain_config(
    name = "clang_cl_arm64",
    cpu = "arm64_windows",
    compiler = "clang-cl",
    host_system_name = "local",
    target_system_name = "aarch64-pc-windows-msvc",
    target_libc = "msvcrt",
    abi_version = "local",
    abi_libc_version = "local",
    toolchain_identifier = "clang_cl_arm64",
    msvc_env_tmp = "%{{temp_dir}}",
    msvc_env_path = "%{{msvc_env_path_arm64}}",
    msvc_env_include = "%{{msvc_env_include_arm64}}",
    msvc_env_lib = "%{{msvc_env_lib_arm64}}",
    cxx_builtin_include_directories = [
        %{{msvc_env_include_array_arm64}}
    ],
    tool_paths = {
        "ar": "%{{llvm_path}}/bin/llvm-lib.exe",
        "ml": "%{{llvm_path}}/bin/clang-cl.exe",
        "cpp": "%{{llvm_path}}/bin/clang-cl.exe",
        "gcc": "%{{llvm_path}}/bin/clang-cl.exe",
        "gcov": "wrapper/bin/msvc_nop.bat",
        "ld": "%{{llvm_path}}/bin/lld-link.exe",
        "nm": "%{{llvm_path}}/bin/llvm-nm.exe",
        "objcopy": "wrapper/bin/msvc_nop.bat",
        "objdump": "wrapper/bin/msvc_nop.bat",
        "strip": "wrapper/bin/msvc_nop.bat",
    },
    default_archiver_flags = ["/MACHINE:ARM64"],
    default_link_flags = ["/MACHINE:ARM64"],
)

toolchain(
    name = "cc-toolchain-arm64_windows-clang-cl",
    exec_compatible_with = [
        "@platforms//os:windows",
#        "@bazel_tools//tools/cpp:clang-cl",
    ],
    target_compatible_with = [
        "@platforms//cpu:arm64",
        "@platforms//os:windows",
    ],
    toolchain = ":cc-compiler-arm64_windows-clang-cl",
    toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
)

"""

TOOLCHAIN_CONTENT = """
load("@rules_cc//cc:action_names.bzl", "ACTION_NAMES")
load(
    "@rules_cc//cc:cc_toolchain_config_lib.bzl",
    "action_config",
    "artifact_name_pattern",
    "env_entry",
    "env_set",
    "feature",
    "flag_group",
    "flag_set",
    "make_variable",
    "tool",
    "tool_path",
    "variable_with_value",
    "with_feature_set",
)
load("@rules_cc//cc/common:cc_common.bzl", "cc_common")

all_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.assemble,
    ACTION_NAMES.preprocess_assemble,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.clif_match,
    ACTION_NAMES.lto_backend,
]

all_cpp_compile_actions = [
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.clif_match,
]

preprocessor_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.preprocess_assemble,
    ACTION_NAMES.cpp_header_parsing,
    ACTION_NAMES.clif_match,
]

codegen_compile_actions = [
    ACTION_NAMES.c_compile,
    ACTION_NAMES.cpp_compile,
    ACTION_NAMES.linkstamp_compile,
    ACTION_NAMES.assemble,
    ACTION_NAMES.preprocess_assemble,
    ACTION_NAMES.lto_backend,
]

all_link_actions = [
    ACTION_NAMES.cpp_link_executable,
    ACTION_NAMES.cpp_link_dynamic_library,
    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
]

def _impl(ctx):
    artifact_name_patterns = [
        artifact_name_pattern(
            category_name = "object_file",
            prefix = "",
            extension = ".obj",
        ),
        artifact_name_pattern(
            category_name = "static_library",
            prefix = "",
            extension = ".lib",
        ),
        artifact_name_pattern(
            category_name = "alwayslink_static_library",
            prefix = "",
            extension = ".lo.lib",
        ),
        artifact_name_pattern(
            category_name = "executable",
            prefix = "",
            extension = ".exe",
        ),
        artifact_name_pattern(
            category_name = "dynamic_library",
            prefix = "",
            extension = ".dll",
        ),
        artifact_name_pattern(
            category_name = "interface_library",
            prefix = "",
            extension = ".if.lib",
        ),
    ]

    cpp_link_nodeps_dynamic_library_action = action_config(
        action_name = ACTION_NAMES.cpp_link_nodeps_dynamic_library,
        implies = [
            "shared_flag",
            "linkstamps",
            "output_execpath_flags",
            "input_param_flags",
            "user_link_flags",
            "linker_subsystem_flag",
            "linker_param_file",
            "msvc_env",
            "no_stripping",
            "has_configured_linker_path",
            "def_file",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("ld"))],
    )

    cpp_link_static_library_action = action_config(
        action_name = ACTION_NAMES.cpp_link_static_library,
        implies = [
            "archiver_flags",
            "input_param_flags",
            "linker_param_file",
            "msvc_env",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("ar"))],
    )

    assemble_action = action_config(
        action_name = ACTION_NAMES.assemble,
        implies = [
            "compiler_input_flags",
            "compiler_output_flags",
            "msvc_env",
            "sysroot",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("cpp"))],
    )

    preprocess_assemble_action = action_config(
        action_name = ACTION_NAMES.preprocess_assemble,
        implies = [
            "compiler_input_flags",
            "compiler_output_flags",
            "msvc_env",
            "sysroot",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("ml"))],
    )

    c_compile_action = action_config(
        action_name = ACTION_NAMES.c_compile,
        implies = [
            "compiler_input_flags",
            "compiler_output_flags",
            "msvc_env",
            "user_compile_flags",
            "sysroot",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("cpp"))],
    )

    linkstamp_compile_action = action_config(
        action_name = ACTION_NAMES.linkstamp_compile,
        implies = [
            "compiler_input_flags",
            "compiler_output_flags",
            "msvc_env",
            "user_compile_flags",
            "sysroot",
            "unfiltered_compile_flags",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("cpp"))],
    )

    cpp_compile_action = action_config(
        action_name = ACTION_NAMES.cpp_compile,
        implies = [
            "compiler_input_flags",
            "compiler_output_flags",
            "msvc_env",
            "user_compile_flags",
            "sysroot",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("cpp"))],
    )

    cpp_link_executable_action = action_config(
        action_name = ACTION_NAMES.cpp_link_executable,
        implies = [
            "linkstamps",
            "output_execpath_flags",
            "input_param_flags",
            "user_link_flags",
            "linker_subsystem_flag",
            "linker_param_file",
            "msvc_env",
            "no_stripping",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("ld"))],
    )

    cpp_link_dynamic_library_action = action_config(
        action_name = ACTION_NAMES.cpp_link_dynamic_library,
        implies = [
            "shared_flag",
            "linkstamps",
            "output_execpath_flags",
            "input_param_flags",
            "user_link_flags",
            "linker_subsystem_flag",
            "linker_param_file",
            "msvc_env",
            "no_stripping",
            "has_configured_linker_path",
            "def_file",
        ],
        tools = [tool(path = ctx.attr.tool_paths.get("ld"))],
    )

    action_configs = [
        assemble_action,
        preprocess_assemble_action,
        c_compile_action,
        linkstamp_compile_action,
        cpp_compile_action,
        cpp_link_executable_action,
        cpp_link_dynamic_library_action,
        cpp_link_nodeps_dynamic_library_action,
        cpp_link_static_library_action,
    ]

    msvc_link_env_feature = feature(
        name = "msvc_link_env",
        env_sets = [
            env_set(
                actions = all_link_actions +
                            [ACTION_NAMES.cpp_link_static_library],
                env_entries = [env_entry(key = "LIB", value = ctx.attr.msvc_env_lib)],
            ),
        ],
    )

    shared_flag_feature = feature(
        name = "shared_flag",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.cpp_link_dynamic_library,
                    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
                ],
                flag_groups = [flag_group(flags = ["/DLL"])],
            ),
        ],
    )

    determinism_feature = feature(
        name = "determinism",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [
                    flag_group(
                        flags = [
                            "/wd4117",
                            "-D__DATE__=\\"redacted\\"",
                            "-D__TIMESTAMP__=\\"redacted\\"",
                            "-D__TIME__=\\"redacted\\"",
                        ] + (["-Wno-builtin-macro-redefined"] if ctx.attr.compiler == "clang-cl" else []),
                    ),
                ],
            ),
        ],
    )

    sysroot_feature = feature(
        name = "sysroot",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.cpp_link_executable,
                    ACTION_NAMES.cpp_link_dynamic_library,
                    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["--sysroot=%{sysroot}"],
                        iterate_over = "sysroot",
                        expand_if_available = "sysroot",
                    ),
                ],
            ),
        ],
    )

    unfiltered_compile_flags_feature = feature(
        name = "unfiltered_compile_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["%{unfiltered_compile_flags}"],
                        iterate_over = "unfiltered_compile_flags",
                        expand_if_available = "unfiltered_compile_flags",
                    ),
                ],
            ),
        ],
    )

    archive_param_file_feature = feature(
        name = "archive_param_file",
        enabled = True,
    )

    compiler_param_file_feature = feature(
        name = "compiler_param_file",
        enabled = True,
    )

    copy_dynamic_libraries_to_binary_feature = feature(
        name = "copy_dynamic_libraries_to_binary",
    )

    input_param_flags_feature = feature(
        name = "input_param_flags",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.cpp_link_dynamic_library,
                    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["/IMPLIB:%{interface_library_output_path}"],
                        expand_if_available = "interface_library_output_path",
                    ),
                ],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["%{libopts}"],
                        iterate_over = "libopts",
                        expand_if_available = "libopts",
                    ),
                ],
            ),
            flag_set(
                actions = all_link_actions +
                            [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        iterate_over = "libraries_to_link",
                        flag_groups = [
                            flag_group(
                                iterate_over = "libraries_to_link.object_files",
                                flag_groups = [flag_group(flags = ["%{libraries_to_link.object_files}"])],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file_group",
                                ),
                            ),
                            flag_group(
                                flag_groups = [flag_group(flags = ["%{libraries_to_link.name}"])],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "object_file",
                                ),
                            ),
                            flag_group(
                                flag_groups = [flag_group(flags = ["%{libraries_to_link.name}"])],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "interface_library",
                                ),
                            ),
                            flag_group(
                                flag_groups = [
                                    flag_group(
                                        flags = ["%{libraries_to_link.name}"],
                                        expand_if_false = "libraries_to_link.is_whole_archive",
                                    ),
                                    flag_group(
                                        flags = ["/WHOLEARCHIVE:%{libraries_to_link.name}"],
                                        expand_if_true = "libraries_to_link.is_whole_archive",
                                    ),
                                ],
                                expand_if_equal = variable_with_value(
                                    name = "libraries_to_link.type",
                                    value = "static_library",
                                ),
                            ),
                        ],
                        expand_if_available = "libraries_to_link",
                    ),
                ],
            ),
        ],
    )

    fastbuild_feature = feature(
        name = "fastbuild",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/Od", "/Z7"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["/DEBUG", "/INCREMENTAL:NO"],
                    ),
                ],
            ),
        ],
        implies = ["generate_pdb_file"],
    )

    user_compile_flags_feature = feature(
        name = "user_compile_flags",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["%{user_compile_flags}"],
                        iterate_over = "user_compile_flags",
                        expand_if_available = "user_compile_flags",
                    ),
                ],
            ),
        ],
    )

    archiver_flags_feature = feature(
        name = "archiver_flags",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        flags = ["/OUT:%{output_execpath}"],
                        expand_if_available = "output_execpath",
                    ),
                    flag_group(
                        flags = ["%{user_archiver_flags}"],
                        iterate_over = "user_archiver_flags",
                        expand_if_available = "user_archiver_flags",
                    ),
                ],
            ),
        ],
    )

    default_archiver_flags_feature = feature(
        name = "default_archiver_flags",
        enabled = True,        
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [flag_group(flags = ctx.attr.default_archiver_flags)],
            ),
        ],
    )

    default_link_flags_feature = feature(
        name = "default_link_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ctx.attr.default_link_flags)],
            ),
        ],
    )

    static_link_msvcrt_feature = feature(
        name = "static_link_msvcrt",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/MT"])],
                with_features = [with_feature_set(not_features = ["dbg"])],
            ),
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/MTd"])],
                with_features = [with_feature_set(features = ["dbg"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ["/DEFAULTLIB:libcmt.lib"])],
                with_features = [with_feature_set(not_features = ["dbg"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ["/DEFAULTLIB:libcmtd.lib"])],
                with_features = [with_feature_set(features = ["dbg"])],
            ),
        ],
    )

    dynamic_link_msvcrt_feature = feature(
        name = "dynamic_link_msvcrt",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/MD"])],
                with_features = [with_feature_set(not_features = ["dbg", "static_link_msvcrt"])],
            ),
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/MDd"])],
                with_features = [with_feature_set(features = ["dbg"], not_features = ["static_link_msvcrt"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ["/DEFAULTLIB:msvcrt.lib"])],
                with_features = [with_feature_set(not_features = ["dbg", "static_link_msvcrt"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ["/DEFAULTLIB:msvcrtd.lib"])],
                with_features = [with_feature_set(features = ["dbg"], not_features = ["static_link_msvcrt"])],
            ),
        ],
    )

    dbg_feature = feature(
        name = "dbg",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/Od", "/Z7"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["/DEBUG", "/INCREMENTAL:NO"],
                    ),
                ],
            ),
        ],
        implies = ["generate_pdb_file"],
    )

    opt_feature = feature(
        name = "opt",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/O2"])],
            ),
        ],
        implies = ["frame_pointer"],
    )

    supports_interface_shared_libraries_feature = feature(
        name = "supports_interface_shared_libraries",
        enabled = True,
    )

    user_link_flags_feature = feature(
        name = "user_link_flags",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["%{user_link_flags}"],
                        iterate_over = "user_link_flags",
                        expand_if_available = "user_link_flags",
                    ),
                ],
            ),
        ],
    )

    default_compile_flags_feature = feature(
        name = "default_compile_flags",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.lto_backend,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group(
                        flags = [
                            "/DCOMPILER_MSVC",
                            "/DNOMINMAX",
                            "/D_WIN32_WINNT=0x0601",
                            "/D_CRT_SECURE_NO_DEPRECATE",
                            "/D_CRT_SECURE_NO_WARNINGS",
                            "/bigobj",
                            "/Zm500",
                            "/EHsc",
                            "/wd4351",
                            "/wd4291",
                            "/wd4250",
                            "/wd4996",
                            "--target=" + ctx.attr.target_system_name,
                        ],
                    ),
                ],
            ),
        ],
    )

    msvc_compile_env_feature = feature(
        name = "msvc_compile_env",
        env_sets = [
            env_set(
                actions = [
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                ],
                env_entries = [env_entry(key = "INCLUDE", value = ctx.attr.msvc_env_include)],
            ),
        ],
    )

    preprocessor_defines_feature = feature(
        name = "preprocessor_defines",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["/D%{preprocessor_defines}"],
                        iterate_over = "preprocessor_defines",
                    ),
                ],
            ),
        ],
    )

    generate_pdb_file_feature = feature(
        name = "generate_pdb_file",
    )

    generate_linkmap_feature = feature(
        name = "generate_linkmap",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.cpp_link_executable,
                ],
                flag_groups = [
                    flag_group(
                        flags = [
                            "/MAP:%{output_execpath}.map",
                        ],
                        expand_if_available = "output_execpath",
                    ),
                ],
            ),
        ],
    )

    output_execpath_flags_feature = feature(
        name = "output_execpath_flags",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["/OUT:%{output_execpath}"],
                        expand_if_available = "output_execpath",
                    ),
                ],
            ),
        ],
    )

    disable_assertions_feature = feature(
        name = "disable_assertions",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/DNDEBUG"])],
                with_features = [with_feature_set(features = ["opt"])],
            ),
        ],
    )

    has_configured_linker_path_feature = feature(name = "has_configured_linker_path")

    supports_dynamic_linker_feature = feature(name = "supports_dynamic_linker", enabled = True)

    no_stripping_feature = feature(name = "no_stripping")

    linker_param_file_feature = feature(
        name = "linker_param_file",
        flag_sets = [
            flag_set(
                actions = all_link_actions +
                            [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [
                    flag_group(
                        flags = ["@%{linker_param_file}"],
                        expand_if_available = "linker_param_file",
                    ),
                ],
            ),
        ],
    )

    ignore_noisy_warnings_feature = feature(
        name = "ignore_noisy_warnings",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [flag_group(flags = ["/ignore:4221"])],
            ),
        ],
    )

    no_legacy_features_feature = feature(name = "no_legacy_features")

    dependency_file_feature = feature(
        name = "dependency_file",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_module_compile,
                    ACTION_NAMES.objc_compile,
                    ACTION_NAMES.objcpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.clif_match,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["/clang:-MD", "/clang:-MF%{dependency_file}"],
                        expand_if_available = "dependency_file",
                    ),
                ],
            ),
        ],
    )

    treat_warnings_as_errors_feature = feature(
        name = "treat_warnings_as_errors",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile] + all_link_actions,
                flag_groups = [flag_group(flags = ["/WX"])],
            ),
        ],
    )

    windows_export_all_symbols_feature = feature(name = "windows_export_all_symbols")

    no_windows_export_all_symbols_feature = feature(name = "no_windows_export_all_symbols")

    include_paths_feature = feature(
        name = "include_paths",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["/I%{quote_include_paths}"],
                        iterate_over = "quote_include_paths",
                    ),
                    flag_group(
                        flags = ["/I%{include_paths}"],
                        iterate_over = "include_paths",
                    ),
                    flag_group(
                        flags = ["/I%{system_include_paths}"],
                        iterate_over = "system_include_paths",
                    ),
                ],
            ),
        ],
    )

    external_include_paths_feature = feature(
        name = "external_include_paths",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.clif_match,
                    ACTION_NAMES.objc_compile,
                    ACTION_NAMES.objcpp_compile,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["/external:I%{external_include_paths}"],
                        iterate_over = "external_include_paths",
                        expand_if_available = "external_include_paths",
                    ),
                ],
            ),
        ],
    )

    linkstamps_feature = feature(
        name = "linkstamps",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["%{linkstamp_paths}"],
                        iterate_over = "linkstamp_paths",
                        expand_if_available = "linkstamp_paths",
                    ),
                ],
            ),
        ],
    )

    targets_windows_feature = feature(
        name = "targets_windows",
        enabled = True,
        implies = ["copy_dynamic_libraries_to_binary"],
    )

    linker_subsystem_flag_feature = feature(
        name = "linker_subsystem_flag",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ["/SUBSYSTEM:CONSOLE"])],
            ),
        ],
    )

    frame_pointer_feature = feature(
        name = "frame_pointer",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/Oy-"])],
            ),
        ],
    )

    compiler_output_flags_feature = feature(
        name = "compiler_output_flags",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.assemble],
                flag_groups = [
                    flag_group(
                        flag_groups = [
                            flag_group(
                                flags = ["/Fo%{output_file}", "/Zi"],
                                expand_if_available = "output_file",
                                expand_if_not_available = "output_assembly_file",
                            ),
                        ],
                        expand_if_not_available = "output_preprocess_file",
                    ),
                ],
            ),
            flag_set(
                actions = [
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                ],
                flag_groups = [
                    flag_group(
                        flag_groups = [
                            flag_group(
                                flags = ["/Fo%{output_file}"],
                                expand_if_not_available = "output_preprocess_file",
                            ),
                        ],
                        expand_if_available = "output_file",
                        expand_if_not_available = "output_assembly_file",
                    ),
                    flag_group(
                        flag_groups = [
                            flag_group(
                                flags = ["/Fa%{output_file}"],
                                expand_if_available = "output_assembly_file",
                            ),
                        ],
                        expand_if_available = "output_file",
                    ),
                    flag_group(
                        flag_groups = [
                            flag_group(
                                flags = ["/P", "/Fi%{output_file}"],
                                expand_if_available = "output_preprocess_file",
                            ),
                        ],
                        expand_if_available = "output_file",
                    ),
                ],
            ),
        ],
    )

    smaller_binary_feature = feature(
        name = "smaller_binary",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/Gy", "/Gw"])],
                with_features = [with_feature_set(features = ["opt"])],
            ),
            flag_set(
                actions = all_link_actions,
                flag_groups = [flag_group(flags = ["/OPT:ICF", "/OPT:REF"])],
                with_features = [with_feature_set(features = ["opt"])],
            ),
        ],
    )

    remove_unreferenced_code_feature = feature(
        name = "remove_unreferenced_code",
        enabled = True,
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.c_compile, ACTION_NAMES.cpp_compile],
                flag_groups = [flag_group(flags = ["/Zc:inline"])],
            ),
        ],
    )

    compiler_input_flags_feature = feature(
        name = "compiler_input_flags",
        flag_sets = [
            flag_set(
                actions = [
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                ],
                flag_groups = [
                    flag_group(
                        flags = ["/c", "%{source_file}"],
                        expand_if_available = "source_file",
                    ),
                ],
            ),
        ],
    )

    def_file_feature = feature(
        name = "def_file",
        flag_sets = [
            flag_set(
                actions = all_link_actions,
                flag_groups = [
                    flag_group(
                        flags = ["/DEF:%{def_file_path}", "/ignore:4070"],
                        expand_if_available = "def_file_path",
                    ),
                ],
            ),
        ],
    )

    msvc_env_feature = feature(
        name = "msvc_env",
        env_sets = [
            env_set(
                actions = [
                    ACTION_NAMES.c_compile,
                    ACTION_NAMES.linkstamp_compile,
                    ACTION_NAMES.cpp_compile,
                    ACTION_NAMES.cpp_header_parsing,
                    ACTION_NAMES.assemble,
                    ACTION_NAMES.preprocess_assemble,
                    ACTION_NAMES.cpp_link_executable,
                    ACTION_NAMES.cpp_link_dynamic_library,
                    ACTION_NAMES.cpp_link_nodeps_dynamic_library,
                    ACTION_NAMES.cpp_link_static_library,
                ],
                env_entries = [
                    env_entry(key = "PATH", value = ctx.attr.msvc_env_path),
                    env_entry(key = "TMP", value = ctx.attr.msvc_env_tmp),
                    env_entry(key = "TEMP", value = ctx.attr.msvc_env_tmp),
                ],
            ),
        ],
        implies = ["msvc_compile_env", "msvc_link_env"],
    )

    symbol_check_feature = feature(
        name = "symbol_check",
        flag_sets = [
            flag_set(
                actions = [ACTION_NAMES.cpp_link_static_library],
                flag_groups = [flag_group(flags = ["/WX:4006"])],
            ),
        ],
    )

    features = [
        no_legacy_features_feature,
        has_configured_linker_path_feature,
        no_stripping_feature,
        targets_windows_feature,
        copy_dynamic_libraries_to_binary_feature,
        default_compile_flags_feature,
        msvc_env_feature,
        msvc_compile_env_feature,
        msvc_link_env_feature,
        include_paths_feature,
        external_include_paths_feature,
        preprocessor_defines_feature,
        dependency_file_feature,
        generate_pdb_file_feature,
        generate_linkmap_feature,
        shared_flag_feature,
        linkstamps_feature,
        output_execpath_flags_feature,
        archiver_flags_feature,
        default_archiver_flags_feature,
        input_param_flags_feature,
        linker_subsystem_flag_feature,
        user_link_flags_feature,
        default_link_flags_feature,
        linker_param_file_feature,
        static_link_msvcrt_feature,
        dynamic_link_msvcrt_feature,
        dbg_feature,
        fastbuild_feature,
        opt_feature,
        frame_pointer_feature,
        disable_assertions_feature,
        determinism_feature,
        treat_warnings_as_errors_feature,
        smaller_binary_feature,
        remove_unreferenced_code_feature,
        ignore_noisy_warnings_feature,
        user_compile_flags_feature,
        sysroot_feature,
        unfiltered_compile_flags_feature,
        archive_param_file_feature,
        compiler_param_file_feature,
        compiler_output_flags_feature,
        compiler_input_flags_feature,
        def_file_feature,
        windows_export_all_symbols_feature,
        no_windows_export_all_symbols_feature,
        supports_dynamic_linker_feature,
        supports_interface_shared_libraries_feature,
        symbol_check_feature,
    ]

    tool_paths = [
        tool_path(name = name, path = path)
        for name, path in ctx.attr.tool_paths.items()
    ]

    make_variables = []

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        features = features,
        action_configs = action_configs,
        artifact_name_patterns = artifact_name_patterns,
        cxx_builtin_include_directories = ctx.attr.cxx_builtin_include_directories,
        toolchain_identifier = ctx.attr.toolchain_identifier,
        host_system_name = ctx.attr.host_system_name,
        target_system_name = ctx.attr.target_system_name,
        target_cpu = ctx.attr.cpu,
        target_libc = ctx.attr.target_libc,
        compiler = ctx.attr.compiler,
        abi_version = ctx.attr.abi_version,
        abi_libc_version = ctx.attr.abi_libc_version,
        tool_paths = tool_paths,
        make_variables = make_variables,
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {
        "abi_libc_version": attr.string(),
        "abi_version": attr.string(),
        "compiler": attr.string(),
        "cpu": attr.string(mandatory = True),
        "cxx_builtin_include_directories": attr.string_list(),
        "default_archiver_flags": attr.string_list(default = []),
        "default_compile_flags": attr.string_list(default = []),
        "default_link_flags": attr.string_list(default = []),
        "host_system_name": attr.string(),
        "msvc_env_include": attr.string(default = ""),
        "msvc_env_lib": attr.string(default = ""),
        "msvc_env_path": attr.string(default = ""),
        "msvc_env_tmp": attr.string(default = ""),
        "target_libc": attr.string(),
        "target_system_name": attr.string(),
        "tool_bin_path": attr.string(default = "not_found"),
        "tool_paths": attr.string_dict(),
        "toolchain_identifier": attr.string(),
    },
    provides = [CcToolchainConfigInfo],
)
"""

def _get_path_env_var(repository_ctx, name):
    """Returns a path from an environment variable with removing quotes."""

    value = repository_ctx.getenv(name)
    if value == None:
        return None

    if value[0] == "\"" and len(value) > 1 and value[-1] != "\"":
        value = value[1:-1]
    if "/" in value:
        value = value.replace("/", "\\")
    if value[-1] == "\\":
        value = value.rstrip("\\")
    return value

def _execute(repository_ctx, commands, environment = {}):
    stdout = repository_ctx.execute(commands, environment = environment).stdout
    lines = []
    for line in stdout.splitlines():
        lines.append(line.rstrip(" ").lstrip(" "))
    if len(lines) == 0:
        return None
    return lines

def _get_vsvarsall_map(repository_ctx):
    program_files_dir = _get_path_env_var(repository_ctx, "ProgramFiles(x86)")
    if not program_files_dir:
        fail("'ProgramFiles(x86)' environment variable is not set.")

    vswhere_binary = program_files_dir + "\\Microsoft Visual Studio\\Installer\\vswhere.exe"
    if not repository_ctx.path(vswhere_binary).exists:
        fail("Filed to locale vswhere.exe")

    x64_commands = [
        vswhere_binary,
        "-products",
        "Microsoft.VisualStudio.Product.Enterprise",
        "Microsoft.VisualStudio.Product.Professional",
        "Microsoft.VisualStudio.Product.Community",
        "Microsoft.VisualStudio.Product.BuildTools",
        "-find",
        "VC/Auxiliary/Build/vcvarsall.bat",
        "-utf8",
        "-requires",
        "Microsoft.VisualStudio.Component.VC.Tools.x86.x64",
        "Microsoft.VisualStudio.Component.VC.Redist.14.Latest",
    ]

    arm64_commands = x64_commands + [
        "Microsoft.VisualStudio.Component.VC.Tools.ARM64",
    ]
    vsvarsall = _execute(repository_ctx, arm64_commands)
    if vsvarsall:
        return {
            "arm64": vsvarsall[0],
            "x64": vsvarsall[0],
            "x86": vsvarsall[0],
        }

    vsvarsall = _execute(repository_ctx, x64_commands)
    if not vsvarsall:
        fail("Required Visual Studio components are not fully installed")
    return {
        "x64": vsvarsall[0],
        "x86": vsvarsall[0],
    }

def _normalize_arch(arch):
    if not arch:
        return arch
    lower = arch.lower()
    if lower == "amd64":
        return "x64"
    return lower

def _get_vs_dirs_map(repository_ctx):
    vsvarsall_map = _get_vsvarsall_map(repository_ctx)

    env_names = [
        "INCLUDE",
        "LIB",
        "PATH",
    ]

    host_arch = _normalize_arch(repository_ctx.os.arch)
    env_map = {}
    for arch in ["x64", "x86", "arm64"]:
        vcvars_script = vsvarsall_map.get(arch)
        if not vcvars_script:
            continue

        target_arch = arch if arch == host_arch else (host_arch + "_" + arch)
        cmd = "\"%s\" %s" % (vcvars_script, target_arch)
        print_envpairs = "\n".join(["echo {k}=%{k}%".format(k = env_name) for env_name in env_names])
        batch_file = "@echo off\n" + ("call %s > NUL \n" % cmd) + print_envpairs
        repository_ctx.file(
            "get_env.bat",
            batch_file,
            executable = True,
        )

        env = {env_name: "" for env_name in env_names}
        env["PATH"] = _get_path_env_var(repository_ctx, "SYSTEMROOT") + "\\system32"
        lines = _execute(repository_ctx, ["./get_env.bat"], environment = env)
        arch_dirs_map = {}
        for line in lines:
            if not line:
                continue
            if line.find("=") < 0:
                continue
            key, value = line.split("=", 1)
            if value.find("\\\\") > 0:
                value = value.replace("\\\\", "\\")
            dirs = []
            for path_str in value.split(";"):
                path = repository_ctx.path(path_str)
                if not (path.exists and path.is_dir):
                    continue
                dirs.append(str(path.realpath))
            arch_dirs_map[key] = dirs
        env_map[arch] = arch_dirs_map

    return env_map


def _local_clnag_cl_repository_impl(repository_ctx):
    if not repository_ctx.os.name.lower().startswith("win"):
        repository_ctx.file("BUILD.bazel", "")
        return

    provided_llvm_path_str = repository_ctx.attr.llvm_path

    use_workspace_relative = False
    llvm_path = None
    for prefix in ["$WORKSPACE_ROOT/", "$WORKSPACE_ROOT\\"]:
        if provided_llvm_path_str.startswith(prefix):
            workspace_relative_path_str = provided_llvm_path_str.removeprefix(prefix)
            llvm_path = repository_ctx.workspace_root.get_child(workspace_relative_path_str)
            use_workspace_relative = True
            break
    if not use_workspace_relative:
        llvm_path = repository_ctx.path(provided_llvm_path_str)

    llvm_path_str = str(llvm_path)
    if not llvm_path.exists:
        fail("LLVM path='{}' does not exist".format(llvm_path_str))
    if not llvm_path.is_dir:
        fail("LLVM path='{}' is not a directory".format(llvm_path_str))

    repository_ctx.watch_tree(llvm_path)

    temp_dir_str = repository_ctx.getenv("TEMP").replace("\\", "/")
    if not temp_dir_str:
        fail("'TEMP' is empty")

    vs_dirs_map = _get_vs_dirs_map(repository_ctx)

    paths_x64 = ";".join(vs_dirs_map["x64"]["PATH"])
    libs_x64 = ";".join(vs_dirs_map["x64"]["LIB"] + [llvm_path_str + "/lib/clang/20/lib/windows"])
    include_x64 = vs_dirs_map["x64"]["INCLUDE"] + [llvm_path_str + "/lib/clang/20/include"]

    paths_x86 = ";".join(vs_dirs_map["x86"]["PATH"])
    libs_x86 = ";".join(vs_dirs_map["x86"]["LIB"] + [llvm_path_str + "/lib/clang/20/lib/windows"])
    include_x86 = vs_dirs_map["x86"]["INCLUDE"] + [llvm_path_str + "/lib/clang/20/include"]

    paths_arm64 = ";".join(vs_dirs_map["arm64"]["PATH"])
    libs_arm64 = ";".join(vs_dirs_map["arm64"]["LIB"] + [llvm_path_str + "/lib/clang/20/lib/windows"])
    include_arm64 = vs_dirs_map["arm64"]["INCLUDE"] + [llvm_path_str + "/lib/clang/20/include"]

    build_content = BUILD_CONTENT
    build_content = build_content.replace("%{{llvm_path}}", llvm_path_str)
    build_content = build_content.replace("%{{temp_dir}}", temp_dir_str)
    build_content = build_content.replace("%{{msvc_env_path_x64}}", paths_x64)
    build_content = build_content.replace("%{{msvc_env_lib_x64}}", libs_x64)
    build_content = build_content.replace("%{{msvc_env_include_x64}}", ";".join(include_x64))
    build_content = build_content.replace("%{{msvc_env_include_array_x64}}", ",\n".join(["\"{}\"".format(path) for path in include_x64]))
    build_content = build_content.replace("%{{msvc_env_path_x86}}", paths_x86)
    build_content = build_content.replace("%{{msvc_env_lib_x86}}", libs_x86)
    build_content = build_content.replace("%{{msvc_env_include_x86}}", ";".join(include_x86))
    build_content = build_content.replace("%{{msvc_env_include_array_x86}}", ",\n".join(["\"{}\"".format(path) for path in include_x86]))
    build_content = build_content.replace("%{{msvc_env_path_arm64}}", paths_arm64)
    build_content = build_content.replace("%{{msvc_env_lib_arm64}}", libs_arm64)
    build_content = build_content.replace("%{{msvc_env_include_arm64}}", ";".join(include_arm64))
    build_content = build_content.replace("%{{msvc_env_include_array_arm64}}", ",\n".join(["\"{}\"".format(path) for path in include_arm64]))

    repository_ctx.file("BUILD.bazel", build_content, executable = False)
    repository_ctx.file("windows_cc_toolchain_config.bzl", TOOLCHAIN_CONTENT, executable = False)

local_clnag_cl_repository = repository_rule(
    implementation = _local_clnag_cl_repository_impl,
    configure = True,
    local = True,
    attrs = {
        "llvm_path": attr.string(mandatory = True),
    },
    environ = ["PATH", "ProgramFiles(x86)", "SYSTEMROOT", "TEMP"],
)

def _clang_cl_extension_impl(module_ctx):
    root_module = None
    for mod in module_ctx.modules:
        if mod.is_root:
            root_module = mod
            break

    # If being set multiple times, use the last one
    llvm_path = None
    for configure in reversed(root_module.tags.configure):
        if configure:
            llvm_path = configure.llvm_path
            break
    local_clnag_cl_repository(
        name = "local_clang_cl",
        llvm_path = llvm_path,
    )
    return module_ctx.extension_metadata(reproducible = True)

clang_cl = module_extension(
    implementation = _clang_cl_extension_impl,
    tag_classes = {
        "configure": tag_class(attrs = {
            "llvm_path": attr.string(mandatory = True),
        }),
    },
    environ = ["PATH", "ProgramFiles(x86)", "SYSTEMROOT", "TEMP"],
)
