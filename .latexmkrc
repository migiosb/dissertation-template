# Verwende XeLaTeX für die Hauptdatei Diss.tex
$pdf_mode = 5;
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Biber wird von latexmk anhand der biblatex-Konfiguration automatisch benötigt
$biber = 'biber %O %B';

# Glossar-/Symbol-/Abkürzungsverzeichnis mit xindy erzeugen
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
add_cus_dep('slo', 'sls', 0, 'makeglossaries');
add_cus_dep('ntn', 'not', 0, 'makeglossaries');

sub makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    return system("makeglossaries \"$base_name\"");
}

# Mehrfachausführung bis alle Verweise stabil sind
$max_repeat = 5;