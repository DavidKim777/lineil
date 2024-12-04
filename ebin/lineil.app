{application, 'lineil', [
	{description, "New project"},
	{vsn, "0.1.0"},
	{modules, ['lineil_app','lineil_sup']},
	{registered, [lineil_sup]},
	{applications, [kernel,stdlib]},
	{optional_applications, []},
	{mod, {lineil_app, []}},
	{env, []}
]}.