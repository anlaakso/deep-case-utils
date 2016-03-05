require! {
	'prelude-ls' : { is-type, map, pairs-to-obj, camelize },
	case : {
		upper, lower, snake, pascal, camel, kebab, constant, capital, title, flip
	}
} 

is-array = (arg) ->
	is-type \Array, arg

is-object = (arg) ->
	is-type \Object, arg

change-case-deep = (fn) ->
	set-value = (val) ->  unless (is-array val or is-object val) then val else (val |> change-case)

	change-case = (entity) ->
		if is-array entity
			[ change-case .. for entity ]
		else if is-object entity
			{ [ (key |> fn), (val |> set-value), entity ] for own let key, val of entity }
		else entity

	return change-case


module.exports =  [
	[ \camel,    change-case-deep camel ]
	[ \upper,    change-case-deep upper ]
	[ \lower,    change-case-deep lower ]
	[ \snake,    change-case-deep snake ]
	[ \pascal,    change-case-deep pascal ]
	[ \kebab,    change-case-deep kebab ]
	[ \constant,    change-case-deep constant ]
	[ \capital,    change-case-deep capital ]
	[ \title,    change-case-deep title ]
	[ \flip,    change-case-deep flip ]
]   
	|> map (-> [(camelize "#{it.0}-case"), it.1])
	|> pairs-to-obj
