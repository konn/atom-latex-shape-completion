greek_dictionary = [
    {index: 'a', name: 'alpha', preview: 'α'}
    {index: 'b', name: 'beta', preview: 'β'}
    {index: 'g', name: 'gamma', preview: 'γ'}
    {index: 'd', name: 'delta', preview: 'δ'}
    {index: 'e', name: 'varepsilon', preview: 'ε'}
    {index: 'e-', name: 'epsilon', preview: 'ϵ'}
    {index: 'et', name: 'eta', preview: 'η'}
    {index: 'z', name: 'zeta', preview: 'ζ'}
    {index: 't', name: 'tau', preview: 'τ'}
    {index: 'th', name: 'theta', preview: 'θ'}
    {index: 'th-', name: 'vartheta', preview: 'ϑ'}
    {index: 'i', name: 'iota', preview: 'ι'}
    {index: 'k', name: 'kappa', preview: 'κ'}
    {index: 'l', name: 'lambda', preview: 'λ'}
    {index: 'm', name: 'mu', preview: 'μ'}
    {index: 'n', name: 'nu', preview: 'ν'}
    {index: 'x', name: 'xi', preview: 'ξ'}
    {index: 'o', name: 'omega', preview: 'ω'}
    {index: 'p', name: 'pi', preview: 'π'}
    {index: 'ph', name: 'varphi', preview: 'φ'}
    {index: 'ph-', name: 'phi', preview: 'ϕ'}
    {index: 'p-', name: 'varpi', preview: 'ϖ'}
    {index: 'ps', name: 'psi', preview: 'ψ'}
    {index: 'r', name: 'rho', preview: 'ρ'}
    {index: 's', name: 'sigma', preview: 'σ'}
    {index: 's-', name: 'varsigma', preview: 'ς'}
    {index: 'u', name: 'upsilon', preview: 'υ'}
    {index: 'c', name: 'chi', preview: 'χ'}
  ]

shape_dictionary = [
    {index: '|\\|', name: 'aleph', preview: 'ℵ'}
    {index: ']', name: 'beth', preview: 'ℶ'}
    {index: '||-', name: 'Vdash', preview: '⊩'}
    {index: '/\\', name: 'land', preview: '∧'}
    {index: '\\/', name: 'lor', preview: '∨'}
    {index: 'prod', name: 'prod', preview: '∏'}
    {index: 'sum', name: 'sum', preview: '∑'}
    {index: '{', name: 'in', preview: '∈'}
    {index: '}', name: 'ni', preview: '∋'}
    {index: '{/', name: 'notin', preview: '∉'}
    {index: '(', name: 'subset', preview: '⊂'}
    {index: '(-', name: 'subseteq', preview: '⊆'}
    {index: '(=', name: 'subseteqq', preview: '⫅'}
    {index: ')', name: 'supset', preview: '⊃'}
    {index: ')-', name: 'supseteq', preview: '⊇'}
    {index: ')=', name: 'supseteqq', preview: '⫆'}
    {index: '=/', name: 'neq', preview: '≠'}
    {index: '==', name: 'equiv', preview: '≡'}
    {index: '==/', name: 'nequiv', preview: '≢'}
    {index: '<', name: 'leq', preview: '≤'}
    {index: '</', name: 'nleq', preview: '≰'}
    {index: '>', name: 'geq', preview: '≥'}
    {index: '>/', name: 'ngeq', preview: '≱'}
    {index: '<<', name: 'll', preview: '≪'}
    {index: '>>', name: 'ngeq', preview: '≫'}
    {index:'<\'',  name: 'langle', preview: '⟨'}
    {index:'>\'',  name: 'rangle', preview: '⟩'}
    {index: '->', name: 'rightarrow', preview: '→'}
    {index: '=>', name: 'Rightarrow', preview: '⇒'}
    {index: '==>', name: 'implies', preview: '⟹'}
    {index: '-->', name: 'longrightarrow', preview: '⟶'}
    {index: 'x->', name: 'xrightarrow',preview: '⟶^_',type: 'section',args: [{type: 'optional'}, {type: 'fixed'}]}
    {index: '|->', name: 'mapsto', preview: '↦'}
    {index: '|=>', name: 'Mapsto', preview: '↦'}
    {index: '>->', name: 'rightarrowtail', preview: '↣'}
    {index: '->>', name: 'twoheadrightarrow', preview: '↠'}
    {index: '(->', name: 'hookrightarrow', preview: '↪'}
    {index: '~>', name: 'leadsto', preview: '⇝'}
    {index: '<-', name: 'leftarrow', preview: '←'}
    {index: '<<-', name: 'twoheadleftarrow', preview: '↞'}
    {index: '<-<', name: 'leftarrowtail', preview: '↢'}
    {index: '<-)', name: 'hookleftarrow', preview: '↩'}
    {index: '<-|', name: 'mapsfrom', preview: '↤'}
    {index: '<=|', name: 'Mapsfrom', preview: '⤆'}
    {index: '<--', name: 'longleftarrow', preview: '⟵'}
    {index: '<=', name: 'Leftarrow', preview: '⟵'}
    {index: '<==', name: 'impliedby', preview: '⟸'}
  ]

section_dictionary = [
    {name: 'documentclass', args: [{type: "optional", default: "a4j"}, {type: "fixed", default: "jsarticle"}]}
    {name: 'section'}
    {name: 'section*'}
    {name: 'subsection'}
    {name: 'subsection*'}
    {name: 'usepackage', args: [{type: "optional"}, {type: "fixed"}]}
    {name: 'mathit'}  
    {name: 'mathrm'}  
    {name: 'mathds'}  
    {name: 'mathbb'}  
    {name: 'mathcal'} 
    {name: 'mathsf' }  
    {name: 'mathscr'} 
    {name: 'mathbf'}  
    {name: 'mathfrak'}
    {name: 'emph'}
  ]

envrionment_dictionary = [
    {name: 'align'}
    {name: 'align*'}
    {name: 'aligned', args: [type: 'optional']}
    {name: 'alignat', args: [type: 'fixed']}
    {name: 'alignat*', args: [type: 'fixed']}
    {name: 'alignedat', args: [{type: 'optional'}, {type: 'fixed'}]}
    {name: 'split'}
    {name: 'cases'}
  ]

maketitle_dictionary = [
    {name: 'maketitle'}
    {name: 'printbibliography', args: [type: 'optional']}
  ]

commandType =
    type: 'string'
    enum: [
        {value: 'environment', description: 'Given name corresponds to an environment'}
        {value: 'begin', description: 'Alias for "environment".'}
        {value: 'maketitle', description: 'Given name corresponds to a \\maketitle-like command'}
        {value: 'section', description: 'Given name corresponds to a \\section{...}-like command'}
        {value: 'text', description: 'Just plain text'}
        {value: 'large', description: 'Given name corresponds to a {\\large ...}-style command'}
    ]

argumentSpec =
    type: 'object'
    properties:
        type:
            type: 'string'
            enum: [
                {value: 'fixed', description: 'Fixed argument embraced in {}'}
                {value: 'optional', description: 'Optional argument embraced in [], which can be omitted'}
            ]
        default:
            type: 'string'
    required: ['type']

itemSpec =
    type: 'object'
    properties:
      name:
        type: 'string'
        minLength: 1
      index:
        type: 'string'
        minLength: 1
      preview:
        description: 'Preview string for completion dialog'
        type: 'string'
      args:
        type: 'array'
        description: 'argument type.'
        items: argumentSpec
      postfix:
        type: 'string'
        description: 'postfix for command'
        default: ''
      type: commandType
    required: ['name']

font_dictionary = [
    {index: 'i', type: 'section', name: 'mathit'}
    {index: 'r', type: 'section', name: 'mathrm'}
    {index: 'd', type: 'section', name: 'mathds'}
    {index: 'b', type: 'section', name: 'mathbb'}
    {index: 'c', type: 'section', name: 'mathcal'}
    {index: 's', type: 'section', name: 'mathsf'}
    {index: 'S', type: 'section', name: 'mathscr'}
    {index: 'B', type: 'section', name: 'mathbf'}
    {index: 'f', type: 'section', name: 'mathfrak'}
  ]


build_dictionary = (title, desc, def) ->
    title: title
    description: desc
    type: 'array'
    default: def
    items: itemSpec

module.exports =
    config:
        greek_dictionary:
            build_dictionary(
                'Greek Letter Completion Table',
                'Used for Greek letter completion in math, invoked by ":"',
                greek_dictionary
            )

        shape_dictionary:
            build_dictionary(
                'Image Shape Completion Table',
                'Used for math symbol completion, invoked by ";"',
                shape_dictionary
            )

        font_dictionary:
            build_dictionary(
                'Font Completion Table',
                'Used for math font completion, invoked by "@"',
                font_dictionary
            )

        section_dictionary:
            build_dictionary(
                'Section Completion Table',
                'Used for \\section{...}-type completion',
                section_dictionary
            )

        envrionment_dictionary:
            build_dictionary(
                'Environment Completion Table',
                'Used for \\begin{environment}...\\end{environment}-type completion',
                envrionment_dictionary
            )

        maketitle_dictionary:
            build_dictionary(
                'Maketitle Completion Table',
                'Used for \\maketitle-type completion',
                maketitle_dictionary
            )
