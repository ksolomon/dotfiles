<?php

// https://github.com/FriendsOfPHP/PHP-CS-Fixer/issues/3855

$finder = PhpCsFixer\Finder::create()
	->exclude('vendor')
	->in(__DIR__);

$config = new PhpCsFixer\Config();

return $config
	->setIndent("\t")
	->setLineEnding("\n")
	->setRules([
		'@PSR2' => true,
		'cast_spaces' => ['space' => 'single'],
		'array_syntax' => ['syntax' => 'long'],
		'blank_line_after_namespace' => true,
		'blank_line_after_opening_tag' => true,
		'blank_line_before_statement' => false,
		'function_declaration' => ['closure_function_spacing' => 'one'],
		'braces' => [
			'allow_single_line_closure' => true,
			'position_after_anonymous_constructs' => 'same',
			'position_after_control_structures' => 'same',
			'position_after_functions_and_oop_constructs' => 'same'
		],
		'full_opening_tag' => true,
		'no_closing_tag' => true,
		'no_trailing_whitespace_in_comment' => false,
		'whitespace_after_comma_in_array' => true,
		'no_spaces_inside_parenthesis' => false,
		'phpdoc_no_package' => false,
		'method_argument_space' => true,
		'no_spaces_around_offset' => ['outside'],
		'concat_space' => ['spacing' => 'one'],
		'no_spaces_after_function_name' => false,
		'general_phpdoc_annotation_remove' => false,
		'include' => true,
		'array_indentation' => true,
		'trim_array_spaces' => false,
		'cast_spaces' => ['space' => 'single'],
		'align_multiline_comment' => true,
		'array_syntax' => ['syntax' => 'short'],
		'blank_line_after_opening_tag' => true,
		'blank_line_before_statement' => [
			'statements' => ['return', 'try', 'if', 'while', 'for', 'foreach', 'do', 'case'],
		],
		'braces' => [
			'position_after_functions_and_oop_constructs' => 'same',
			'allow_single_line_closure' => false,
		],
		'cast_spaces' => ['space' => 'single'],
		'class_attributes_separation' => ['elements' => ['const' => 'one', 'method' => 'one', 'property' => 'one', 'trait_import' => 'none']],
		'class_definition' => ['single_line' => true],
		'concat_space' => ['spacing' => 'one'],
		'constant_case' => ['case' => 'lower'],
		'dir_constant' => true,
		'elseif' => true,
		'full_opening_tag' => true,
		'fully_qualified_strict_types' => true,
		'function_declaration' => true,
		// 'WeDevs/space_inside_parenthesis' => true,
		// 'WeDevs/blank_line_after_class_opening' => true,
		'function_typehint_space' => true,
		'global_namespace_import' => ['import_classes' => true],
		'include' => true,
		'line_ending' => true,
		'list_syntax' => ['syntax' => 'long'],
		'lowercase_cast' => true,
		'lowercase_keywords' => true,
		'lowercase_static_reference' => true,
		'magic_constant_casing' => true,
		'magic_method_casing' => true,
		'method_argument_space' => true,
		'native_function_casing' => true,
		'method_chaining_indentation' => true,
		'native_function_type_declaration_casing' => true,
		'new_with_braces' => true,
		'no_alternative_syntax' => true,
		'no_blank_lines_after_class_opening' => false,
		'no_blank_lines_after_phpdoc' => true,
		'no_empty_comment' => true,
		'no_empty_phpdoc' => true,
		'no_empty_statement' => true,
		'no_extra_blank_lines' => ['tokens' => [
			'extra',
			'parenthesis_brace_block',
			'square_brace_block',
			'throw',
			'use',
		]],
		'no_leading_import_slash' => true,
		'no_leading_namespace_whitespace' => true,
		'no_mixed_echo_print' => true,
		'no_multiline_whitespace_around_double_arrow' => true,
		'no_short_bool_cast' => true,
		'echo_tag_syntax' => true,
		'no_singleline_whitespace_before_semicolons' => true,
		'no_spaces_around_offset' => ['positions' => ['outside']],
		'no_spaces_inside_parenthesis' => false,
		'no_superfluous_phpdoc_tags' => ['allow_mixed' => true, 'allow_unused_params' => true],
		'no_trailing_comma_in_list_call' => true,
		'no_trailing_comma_in_singleline_array' => true,
		'no_trailing_whitespace' => true,
		'no_unneeded_control_parentheses' => true,
		'no_unneeded_curly_braces' => true,
		'no_unneeded_final_method' => true,
		'no_unused_imports' => true,
		'no_whitespace_before_comma_in_array' => true,
		'no_whitespace_in_blank_line' => true,
		'normalize_index_brace' => true,
		'object_operator_without_whitespace' => true,
		'ordered_imports' => true,
		'php_unit_fqcn_annotation' => true,
		'phpdoc_align' => [
			'align' => 'vertical',
			'tags' => [
				'method',
				'param',
				'property',
				'return',
				'throws',
				'type',
				'var',
			],
		],
		'phpdoc_annotation_without_dot' => true,
		'phpdoc_indent' => true,
		'general_phpdoc_tag_rename' => ['fix_inline' => false],
		'binary_operator_spaces' => true,
		'phpdoc_no_access' => true,
		'phpdoc_no_alias_tag' => true,
		'phpdoc_no_package' => true,
		'phpdoc_no_useless_inheritdoc' => true,
		'phpdoc_return_self_reference' => true,
		'phpdoc_scalar' => true,
		'phpdoc_separation' => true,
		'phpdoc_single_line_var_spacing' => true,
		'phpdoc_to_comment' => true,
		'phpdoc_trim' => true,
		'phpdoc_trim_consecutive_blank_line_separation' => true,
		'phpdoc_types' => true,
		'phpdoc_types_order' => [
			'null_adjustment' => 'always_last',
			'sort_algorithm' => 'none',
		],
		'phpdoc_var_without_name' => true,
		'return_type_declaration' => true,
		'semicolon_after_instruction' => true,
		'short_scalar_cast' => true,
		'single_blank_line_before_namespace' => true,
		'single_class_element_per_statement' => true,
		'single_line_comment_style' => [
			'comment_types' => ['hash'],
		],
		'single_line_throw' => true,
		'single_quote' => true,
		'single_trait_insert_per_statement' => true,
		'space_after_semicolon' => [
			'remove_in_empty_for_expressions' => true,
		],
		'standardize_increment' => true,
		'standardize_not_equals' => true,
		'ternary_operator_spaces' => true,
		'trailing_comma_in_multiline' => ['elements' => []],
		'trim_array_spaces' => false,
		'whitespace_after_comma_in_array' => true,
	])->setFinder($finder);
