\documentclass{article}
\usepackage[landscape]{geometry}
\geometry{a4paper,left=10mm,right=10mm, top=1cm, bottom=1cm}
\usepackage{ltablex}
\begin{document}
\begin{tabularx}{\linewidth}{lr{% for s in solvers %}rr{% endfor %}}
Input & size
{% for s in solvers -%}
& \multicolumn{2}{c}{\VAR{s}}
{% endfor %}
\\
{% for i in inputs -%}
\VAR{i} & \VAR{data[i]['insize']}
{% for s in solvers -%}
    {% if s in data[i] %}
        {% if 'best' in data[i][s] %}
        & \textbf{\VAR{data[i][s]['outsize']}} & \textbf{\VAR{"%.2f"|format(data[i][s]['time'])}}
        {% else %}
        & \VAR{data[i][s]['outsize']} & \VAR{"%.2f"|format(data[i][s]['time']) }
        {% endif %}
    {% else %}
        & -- & --
    {% endif %}
{%- endfor -%}
\\
{% endfor %}
\end{tabularx}
\end{document}