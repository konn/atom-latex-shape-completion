greek_dictionary = [
    {stroke: 'a', name: 'alpha', preview: 'α'}
    {stroke: 'b', name: 'beta', preview: 'β'}
    {stroke: 'g', name: 'gamma', preview: 'γ'}
    {stroke: 'd', name: 'delta', preview: 'δ'}
    {stroke: 'e', name: 'varepsilon', preview: 'ε'}
    {stroke: 'e-', name: 'epsilon', preview: 'ϵ'}
    {stroke: 'et', name: 'eta', preview: 'η'}
    {stroke: 'z', name: 'zeta', preview: 'ζ'}
    {stroke: 't', name: 'tau', preview: 'τ'}
    {stroke: 'th', name: 'theta', preview: 'θ'}
    {stroke: 'th-', name: 'vartheta', preview: 'ϑ'}
    {stroke: 'i', name: 'iota', preview: 'ι'}
    {stroke: 'k', name: 'kappa', preview: 'κ'}
    {stroke: 'l', name: 'lambda', preview: 'λ'}
    {stroke: 'm', name: 'mu', preview: 'μ'}
    {stroke: 'n', name: 'nu', preview: 'ν'}
    {stroke: 'x', name: 'xi', preview: 'ξ'}
    {stroke: 'o', name: 'omega', preview: 'ω'}
    {stroke: 'p', name: 'pi', preview: 'π'}
    {stroke: 'ph', name: 'varphi', preview: 'φ'}
    {stroke: 'ph-', name: 'phi', preview: 'ϕ'}
    {stroke: 'p-', name: 'varpi', preview: 'ϖ'}
    {stroke: 'ps', name: 'psi', preview: 'ψ'}
    {stroke: 'r', name: 'rho', preview: 'ρ'}
    {stroke: 's', name: 'sigma', preview: 'σ'}
    {stroke: 's-', name: 'varsigma', preview: 'ς'}
    {stroke: 'u', name: 'upsilon', preview: 'υ'}
    {stroke: 'c', name: 'chi', preview: 'χ'}
  ]

shape_dictionary = [
    {stroke: '|\\|', name: 'aleph', preview: 'ℵ'}
    {stroke: ']', name: 'beth', preview: 'ℶ'}
    {stroke: '||-', name: 'Vdash', preview: '⊩'}
    {stroke: '/\\', name: 'land', preview: '∧'}
    {stroke: '\\/', name: 'lor', preview: '∨'}
    {stroke: 'prod', name: 'prod', preview: '∏'}
    {stroke: 'sum', name: 'sum', preview: '∑'}
    {stroke: '{', name: 'in', preview: '∈'}
    {stroke: '}', name: 'ni', preview: '∋'}
    {stroke: '{/', name: 'notin', preview: '∉'}
    {stroke: '(', name: 'subset', preview: '⊂'}
    {stroke: '(-', name: 'subseteq', preview: '⊆'}
    {stroke: '(=', name: 'subseteqq', preview: '⫅'}
    {stroke: ')', name: 'supset', preview: '⊃'}
    {stroke: ')-', name: 'supseteq', preview: '⊇'}
    {stroke: ')=', name: 'supseteqq', preview: '⫆'}
    {stroke: '=/', name: 'neq', preview: '≠'}
    {stroke: '==', name: 'equiv', preview: '≡'}
    {stroke: '==/', name: 'nequiv', preview: '≢'}
    {stroke: '<', name: 'leq', preview: '≤'}
    {stroke: '</', name: 'nleq', preview: '≰'}
    {stroke: '>', name: 'geq', preview: '≥'}
    {stroke: '>/', name: 'ngeq', preview: '≱'}
    {stroke: '<<', name: 'll', preview: '≪'}
    {stroke: '>>', name: 'ngeq', preview: '≫'}
    {stroke:'<\'',  name: 'langle', preview: '⟨'}
    {stroke:'>\'',  name: 'rangle', preview: '⟩'}
    {stroke: '->', name: 'rightarrow', preview: '→'}
    {stroke: '=>', name: 'Rightarrow', preview: '⇒'}
    {stroke: '==>', name: 'implies', preview: '⟹'}
    {stroke: '-->', name: 'longrightarrow', preview: '⟶'}
    {stroke: 'x->', name: 'xrightarrow',preview: '⟶^_',type: 'section',args: ['optional', 'fixed']}
    {stroke: '|->', name: 'mapsto', preview: '↦'}
    {stroke: '|=>', name: 'Mapsto', preview: '↦'}
    {stroke: '>->', name: 'rightarrowtail', preview: '↣'}
    {stroke: '->>', name: 'twoheadrightarrow', preview: '↠'}
    {stroke: '(->', name: 'hookrightarrow', preview: '↪'}
    {stroke: '~>', name: 'leadsto', preview: '⇝'}
    {stroke: '<-', name: 'leftarrow', preview: '←'}
    {stroke: '<<-', name: 'twoheadleftarrow', preview: '↞'}
    {stroke: '<-<', name: 'leftarrowtail', preview: '↢'}
    {stroke: '<-)', name: 'hookleftarrow', preview: '↩'}
    {stroke: '<-|', name: 'mapsfrom', preview: '↤'}
    {stroke: '<=|', name: 'Mapsfrom', preview: '⤆'}
    {stroke: '<--', name: 'longleftarrow', preview: '⟵'}
    {stroke: '<=', name: 'Leftarrow', preview: '⟵'}
    {stroke: '<==', name: 'impliedby', preview: '⟸'}
  ]

section_dictionary = [
    {name: 'section'}
    {name: 'section*'}
    {name: 'subsection'}
    {name: 'subsection*'}
    {name: 'usepackage', args: ["optional", "fixed"]}
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
    {name: 'aligned', args: ['optional']}
    {name: 'alignat', args: ['fixed']}
    {name: 'alignat*', args: ['fixed']}
    {name: 'alignedat', args: ['optional', 'fixed']}
    {name: 'split'}
    {name: 'cases'}
  ]

maketitle_dictionary = [
    {name: 'maketitle'}
    {name: 'printbibliography', args: ['optional']}
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
    type: 'string'
    enum: [
        {value: 'fixed', description: 'Fixed argument embraced in {}'}
        {value: 'optional', description: 'Optional argument embraced in [], which can be omitted'}
    ]

itemSpec =
    type: 'object'
    properties:
      name:
        type: 'string'
        minLength: 1
      stroke:
        type: 'string'
        minLength: 1
      preview:
        description: 'Preview string for completion dialog'
        type: 'string'
      args:
        type: 'array'
        description: 'argument type.'
        items: argumentSpec
      type: commandType
    required: ['name']

font_dictionary = [
    {stroke: 'i', type: 'section', name: 'mathit'}
    {stroke: 'r', type: 'section', name: 'mathrm'}
    {stroke: 'd', type: 'section', name: 'mathds'}
    {stroke: 'b', type: 'section', name: 'mathbb'}
    {stroke: 'c', type: 'section', name: 'mathcal'}
    {stroke: 's', type: 'section', name: 'mathsf'}
    {stroke: 'S', type: 'section', name: 'mathscr'}
    {stroke: 'B', type: 'section', name: 'mathbf'}
    {stroke: 'f', type: 'section', name: 'mathfrak'}
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
