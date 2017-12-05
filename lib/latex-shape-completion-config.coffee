greek_dictionary = [
      {index: "a", name: "alpha", preview: "α"}
      {index: "b", name: "beta", preview: "β"}
      {index: "g", name: "gamma", preview: "γ"}
      {index: "G", name: "Gamma", preview: "Γ"}
      {index: "d", name: "delta", preview: "δ"}
      {index: "D", name: "Delta", preview: "Δ"}
      {index: "e", name: "epsilon", preview: "ϵ"}
      {index: "e-", name: "varepsilon", preview: "ε"}
      {index: "z", name: "zeta", preview: "ζ"}
      {index: "et", name: "eta", preview: "η"}
      {index: "th", name: "theta", preview: "θ"}
      {index: "Th", name: "Theta", preview: "Θ"}
      {index: "th-", name: "vartheta", preview: "ϑ"}
      {index: "i", name: "iota", preview: "ι"}
      {index: "k", name: "kappa", preview: "κ"}
      {index: "k-", name: "varkappa", preview: "ϰ"}
      {index: "l", name: "lambda", preview: "λ"}
      {index: "L", name: "Lambda", preview: "Λ"}
      {index: "m", name: "mu", preview: "μ"}
      {index: "n", name: "nu", preview: "ν"}
      {index: "x", name: "xi", preview: "ξ"}
      {index: "X", name: "Xi", preview: "Ξ"}
      {index: "p", name: "pi", preview: "π"}
      {index: "P", name: "Pi", preview: "Π"}
      {index: "p-", name: "varpi", preview: "ϖ"}
      {index: "r", name: "rho", preview: "ρ"}
      {index: "r-", name: "varrho", preview: "ϱ"}
      {index: "s", name: "sigma", preview: "σ"}
      {index: "S", name: "Sigma", preview: "Σ"}
      {index: "s-", name: "varsigma", preview: "ς"}
      {index: "t", name: "tau", preview: "τ"}
      {index: "u", name: "upsilon", preview: "υ"}
      {index: "y", name: "upsilon", preview: "υ"}
      {index: "U", name: "Upsilon", preview: "Υ"}
      {index: "Y", name: "Upsilon", preview: "Υ"}
      {index: "ph", name: "phi", preview: "φ"}
      {index: "Ph", name: "Phi", preview: "Φ"}
      {index: "ph-", name: "varphi", preview: "φ"}
      {index: "c", name: "chi", preview: "χ"}
      {index: "ps", name: "psi", preview: "ψ"}
      {index: "Ps", name: "Psi", preview: "Ψ"}
      {index: "o", name: "omega", preview: "ω"}
      {index: "w", name: "omega", preview: "ω"}
      {index: "O", name: "Omega", preview: "Ω"}
      {index: "W", name: "Omega", preview: "Ω"}
  ]

shape_dictionary = [
    {index: "integral", name: "int", preview: "∫"}
    {index: "ointegral", name: "oint", preview: "∮"}
    {index: "sqrt", name: "sqrt", preview: "√"}
    {index: "root", name: "sqrt", preview: "√"}
    {index: "A", name: "forall", preview: "∀"}
    {index: "E", name: "exists", preview: "∃"}
    {index: "E/", name: "nexists", preview: "∄"}
    {index: "!", name: "neg", preview: "¬"}
    {index: "-+", name: "mp", preview: "∓"}
    {index: "f", name: "frac", preview: "÷"}
    {index: "*", name: "ast", preview: "*"}
    {index: "o", name: "circ", preview: "o"}
    {index: "o*", name: "bullet", preview: "∙"}
    {index: ".", name: "cdot", preview: "⋅"}
    {index: "cap", name: "cap", preview: "∩"}
    {index: "cup", name: "cup", preview: "∪"}
    {index: "u+", name: "uplus", preview: "⊎"}
    {index: "|~|", name: "sqcap", preview: "⊓"}
    {index: "|_|", name: "sqcup", preview: "⊔"}
    {index: "v", name: "vee", preview: "v"}
    {index: "^", name: "wedge", preview: "^"}
    {index: "\\\\", name: "setminus", preview: "⧵"}
    {index: ")(", name: "wr", preview: " ≀"}
    {index: "<>", name: "diamond", preview: "⋄"}
    {index: "<|", name: "triangleleft", preview: "◁"}
    {index: "|>", name: "triangleright", preview: "▷"}
    {index: "<||", name: "lhd", preview: "⊲"}
    {index: "||>", name: "rhd", preview: "⊳"}
    {index: "<|-", name: "unlhd", preview: "⊴"}
    {index: "|>-", name: "unrhd", preview: "⊵"}
    {index: "o+", name: "oplus", preview: "⊕"}
    {index: "o-", name: "ominus", preview: "⊖"}
    {index: "ox", name: "otimes", preview: "⊗"}
    {index: "o/", name: "oslash", preview: "⊘"}
    {index: "o.", name: "odot", preview: "⊙"}
    {index: "O", name: "bigcirc", preview: "○"}
    {index: "t", name: "dagger", preview: "†"}
    {index: "tt", name: "ddagger", preview: "‡"}
    {index: "II", name: "amalg", preview: "⨿"}
    {index: "-=", name: "equiv", preview: "≡"}
    {index: "=-", name: "equiv", preview: "≡"}
    {index: "---", name: "equiv", preview: "≡"}
    {index: "(", name: "subset", preview: "⊂"}
    {index: "(-", name: "subseteq", preview: "⊆"}
    {index: ")", name: "supset", preview: "⊃"}
    {index: ")-", name: "supseteq", preview: "⊇"}
    {index: "[", name: "sqsubset", preview: "⊏"}
    {index: "[-", name: "sqsubseteq", preview: "⊑"}
    {index: "]", name: "sqsupset", preview: "⊐"}
    {index: "]-", name: "sqsupseteq", preview: "⊒"}
    {index: "{", name: "in", preview: "∈"}
    {index: "}", name: "ni", preview: "∋"}
    {index: "|-", name: "vdash", preview: "⊢"}
    {index: "-|", name: "dashv", preview: "⊣"}
    {index: "~", name: "sim", preview: "~"}
    {index: "~-", name: "simeq", preview: "≃"}
    {index: "asymp", name: "asymp", preview: "≍"}
    {index: "~~", name: "approx", preview: "≈"}
    {index: "~=", name: "cong", preview: "≅"}
    {index: ".=", name: "doteq", preview: "≐"}
    {index: "o<", name: "propto", preview: "∝"}
    {index: "|=", name: "models", preview: "⊧"}
    {index: "_|_", name: "perp", preview: "⟂"}
    {index: "|", name: "mid", preview: "|"}
    {index: "||", name: "parallel", preview: "∥"}
    {index: "bowtie", name: "bowtie", preview: "⋈"}
    {index: "|><|", name: "join", preview: "⋈"}
    {index: "\\_/", name: "smile", preview: "⌣"}
    {index: "/~\\", name: "frown", preview: "⌢"}
    {index: "<<", name: "lll", preview: "⋘"}
    {index: ">>>", name: "ggg", preview: "⋙"}
    {index: "<=", name: "Leftarrow", preview: "⇐"}
    {index: "<==", name: "Longleftarrow", preview: "⟸"}
    {index: "=>", name: "Rightarrow", preview: "⇒"}
    {index: "==>", name: "Longrightarrow", preview: "⟹"}
    {index: "<=>", name: "Leftrightarrow", preview: "⇔"}
    {index: "<==>", name: "Longleftrightarrow", preview: "⟺"}
    {index: "^||", name: "Uparrow", preview: "⇑"}
    {index: "v||", name: "Downarrow", preview: "⇓"}
    {index: "ne", name: "nearrow", preview: "↗"}
    {index: "nw", name: "nwarrow", preview: "↖"}
    {index: "se", name: "searrow", preview: "↘"}
    {index: "sw", name: "swarrow", preview: "↙"}
    {index: "/-", name: "leftharpoonup", preview: "↼"}
    {index: "\\-", name: "leftharpoondown", preview: "↽"}
    {index: "-/", name: "rightharpoondown", preview: "⇁"}
    {index: "-\\", name: "rightharpoonup", preview: "⇀"}
    {
        index: "tilde"
        name: "tilde"
        type: "section"
        preview: "?̃ (accent)"
    }
    {
        index: "T"
        name: "tilde"
        type: "section"
        preview: "?̃ (accent)"
    }
    {
        index: "wtilde"
        name: "widetilde"
        type: "section"
        preview: "~ (wide accent)"
    }
    {index: "hat", name: "hat", preview: "?̂ (accent)", type: "section"}
    {index: "what", name: "widehat", preview: "^ (wide accent)", type: "section"}
    {index: "w^", name: "widehat", preview: "^ (wide accent)", type: "section"}
    {index: "check", name: "check", type: "section", preview: "?̌ (accent)"}
    {index: "bar", name: "bar", preview: "?̄ (accent)", type: "section"}
    {index: "overline", name: "overline", preview: "_ (long bar)", type: "section"}
    {index: "wbar", name: "overline", preview: "_ (long bar)", type: "section"}
    {index: "dot", name: "dot", preview: "?̇ (accent)", type: "section"}
    {index: "ddot", name: "ddot", preview: "?̈ (accent)"}
    {index: "CUP", name: "bigcup", preview: "⋃"}
    {index: "union", name: "bigcup", preview: "⋃"}
    {index: "CAP", name: "bigcap", preview: "⋂"}
    {index: "isc", name: "bigcap", preview: "⋂"}
    {index: "O+", name: "bigoplus", preview: "⨁ (big)"}
    {index: "Ox", name: "bigotimes", preview: "⨂ (big)"}
    {index: "Z", name: "aleph", preview: "ℵ"}
    {index: "|\\|", name: "aleph", preview: "ℵ"}
    {index: "h-", name: "hbar", preview: "ℏ"}
    {index: "l", name: "ell", preview: "ℓ"}
    {index: "wp", name: "wp", preview: "℘"}
    {index: "R", name: "Re", preview: "ℜ"}
    {index: "Im", name: "Im", preview: "ℑ"}
    {index: "mho", name: "mho", preview: "℧"}
    {index: "'", name: "prime", preview: "′"}
    {index: "0", name: "emptyset", preview: "∅"}
    {index: "nabla", name: "nabla", preview: "∇"}
    {index: "\\/", name: "surd", preview: "√"}
    {index: "surd", name: "surd", preview: "√"}
    {index: "top", name: "top", preview: "⊤"}
    {index: "bot", name: "bot", preview: "⊥"}
    {index: "b", name: "flat", preview: "♭"}
    {index: "LT", name: "natural", preview: "♮"}
    {index: "6", name: "partial", preview: "∂"}
    {index: "partial", name: "partial", preview: "∂"}
    {index: "round", name: "partial", preview: "∂"}
    {index: "[]", name: "Box", preview: "□"}
    {index: "no", name: "notag", preview: "(notag)"}
    {index: ":", name: "colon", preview: ":"}
    {index: "Diamond", name: "Diamond", preview: "◇"}
    {index: "3", name: "triangle", preview: "△"}
    {index: "C", name: "clubsuit", preview: "♣"}
    {index: "D", name: "diamondsuit", preview: "♢"}
    {index: "H", name: "heartsuit", preview: "♡"}
    {index: "S", name: "spadesuit", preview: " ♠"}
    {index: "mi", name: "mathit",  type: "section", preview: "mathit"}
    {index: "mr", name: "mathrm",  type: "section", preview: "mathrm"}
    {index: "mb", name: "mathbf",  type: "section", preview: "mathbf"}
    {index: "mt", name: "mathtt",  type: "section", preview: "mathtt"}
    {index: "ms", name: "mathsf",  type: "section", preview: "mathsf"}
    {index: "mc", name: "mathcal", type: "section", preview: "mathcal"}
    {index: "||", name: "|", preview: "‖"}
    {index: "sum", name: "sum", preview: "∑"}
    {index: "sigma", name: "sum", preview: "∑"}
    {index: "oo", name: "infty", preview: "∞"}
    {index: "\\", name: "backslash", preview: "＼"}
    {index: "...", name: "cdots", preview: "…"}
    {index: "+-", name: "pm", preview: "±"}
    {index: "x", name: "times", preview: "×"}
    {index: "/", name: "div", preview: "÷"}
    {index: "#", name: "star", preview: "★"}
    {index: "/\\-", name: "bigtriangleup", preview: "△"}
    {index: "-\\/", name: "bigtriangledown", preview: "▽"}
    {index: "<", name: "leq", preview: "<\n-"}
    {index: "=<", name: "leqq", preview: "≦"}
    {index: ">", name: "geq", preview: ">\n-"}
    {index: ">=", name: "geqq", preview: "≧"}
    {index: "=:", name: "fallingdotseq", preview: "≒"}
    {index: "-<", name: "prec", preview: "く"}
    {index: "-<=", name: "preceq", preview: "く\n="}
    {index: "<<", name: "ll", preview: "《"}
    {index: ">>", name: "gg", preview: "》"}
    {index: "<-", name: "leftarrow", preview: "←"}
    {index: "<--", name: "longleftarrow", preview: "⟵"}
    {index: "->", name: "rightarrow", preview: "→"}
    {index: "-->", name: "longrightarrow", preview: "⟶"}
    {index: "<->", name: "leftrightarrow", preview: "↔"}
    {index: "<-->", name: "longleftrightarrow", preview: "⟷"}
    {index: "^|", name: "uparrow", preview: "↑"}
    {index: "v|", name: "downarrow", preview: "↓"}
    {index: "|->", name: "mapsto", preview: "↦"}
    {index: "<-)", name: "hookleftarrow", preview: "↩"}
    {index: "(->", name: "hookrightarrow", preview: "↪"}
    {index: "vec", name: "vec", preview: "⃗ (accent)"}
    {index: "~>", name: "overrightarrow", preview: "⟶AB (long accent)"}
    {index: "VEC", name: "overrightarrow", preview: "⟶AB (long accent)"}
    {index: "prod", name: "prod", preview: "∏"}
    {index: "angle", name: "angle", preview: "∠"}
    {index: "/_", name: "angle", preview: "∠"}
    {index: ".'.", name: "therefore", preview: "∴"}
    {index: "'.'", name: "because", preview: "∵"}
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

environment_dictionary = [
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

display_math_envs = [
    {
        name: 'align'
        multiline: true
        alignable: true
    }
    {
        name: 'alignat'
        multiline: true
        alignable: true
    }
    {
        name: 'gather'
        multiline: true
        alignable: false
    }
    {
        name: 'align*'
        multiline: true
        alignable: true
    }
    {
        name: 'alignat*'
        multiline: true
        alignable: true
    }
    {
        name: 'gather*'
        multiline: true
        alignable: false
    }
    {
        name: 'aligned'
        multiline: true
        alignable: true
    }
    {
        name: 'alignedat'
        multiline: true
        alignable: true
    }
    {
        name: 'gathered'
        multiline: true
        alignable: true
    }
    {
        name: 'split'
        multiline: true
        alignable: true
    }
    {
        name: 'eqnarray'
        multiline: true
        alignable: true
    }
    {
        name: 'equation'
        multiline: false
        alignable: false
    }
  ]

list_env_config_item =
    type:  'array'
    title: 'List Environments'
    description: 'List of list environments, such as `itemize`, `enumerate` and `description`.'
    items:
        type: 'object'
        properties:
            name:
                type: 'string'
                minLength: 1
            hasOptionalItemArg:
                type: 'bool'
                description: '`\\item` commands take optional argument, as in `\\item[]` in `description`.'
                default: false
            required: ['name']
    default: []
        

math_env_config_item =
    type: 'array'
    title: 'Display Math Environments'
    description: 'Display math environments name, such as `align` and `gather`'
    items:
        type: 'object'
        properties:
            name:
                type: 'string'
                minLength: 1
            multiline:
                type: 'bool'
                description: 'Multiline allowed?'
                default: true
            alignable:
                type: 'bool'
                description: 'Can be aligned by `&`?'
                default: false
        required: ['name']
    default: []

list_envs = [
    {
        name: "itemize"
        hasOptionalItemArg: false
    }
    {
        name: "enumerate"
        hasOptionalItemArg: false
    }
    {
        name: "description"
        hasOptionalItemArg: true
    }
  ]
    

module.exports =
    default_greek_dictionary: greek_dictionary
    default_shape_dictionary: shape_dictionary
    default_section_dictionary: section_dictionary
    default_font_dictionary:    font_dictionary
    default_environment_dictionary: environment_dictionary
    default_maketitle_dictionary: maketitle_dictionary
    default_display_math_dictionary: display_math_envs
    default_list_env_dictionary: list_envs
    
    config:
        display_math_dictionary: math_env_config_item

        list_env_dictionary: list_env_config_item

        greek_dictionary:
            build_dictionary(
                'Greek Letter Completion Table',
                'Used for Greek letter completion in math, invoked by ":"',
                {}
            )

        shape_dictionary:
            build_dictionary(
                'Image Shape Completion Table',
                'Used for math symbol completion, invoked by ";"',
                {}
            )

        font_dictionary:
            build_dictionary(
                'Font Completion Table',
                'Used for math font completion, invoked by "@"',
                {}
            )

        section_dictionary:
            build_dictionary(
                'Section Completion Table',
                'Used for \\section{...}-type completion',
                {}
            )

        environment_dictionary:
            build_dictionary(
                'Environment Completion Table',
                'Used for \\begin{environment}...\\end{environment}-type completion',
                {}
            )

        maketitle_dictionary:
            build_dictionary(
                'Maketitle Completion Table',
                'Used for \\maketitle-type completion',
                {}
            )
