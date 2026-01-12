#!/bin/bash

BASE="/home/kaylon/Documents/Everythingineed/a. PDFs didáticos/"

MENU=$(printf "Matemática\nFísica\nQuímica\nPortuguês\nInglês\\nGeral" | rofi -dmenu -p "")

case "$MENU" in

"Matemática")
  qpdfview \
  "$BASE/1. Mat/μ. Outros/Calculo_para_entender_e_usar_Joao_Barcel.pdf" \
  "$BASE/1. Mat/μ. Outros/Tá estudando Cálculo - Completo.pdf" \
  "$BASE/1. Mat/x. POTI/poti_nivel_2.pdf" \
  "$BASE/1. Mat/x. Titu Andreescu/Titu Andreescu - Exercising with the Mathematical Induction Principle - 3p - MathInduction.pdf" \
  "$BASE/1. Mat/x. Titu Andreescu/Titu_Andreescu,_Dorin_Andrica_Complex_Numbers_from_A_to_Z_Birkhäuser.pdf" \
  "$BASE/1. Mat/x. Titu Andreescu/Titu_Andreescu,_Zuming_Feng_103_Trigonometry_Problems_From_the_Training.pdf" \
  "$BASE/1. Mat/x. Titu Andreescu/Titu_Andreescu,_Marian_Tetiva_Sums_and_Products_XYZ_Press_2018.pdf" \
  "$BASE/1. Mat/x. Tópicos de Matemática IME-ITA/Tópicos de Matemática IME-ITA  Olimpíadas Vol 1.pdf" \
  "$BASE/1. Mat/x. Caio Guimarães/Caio Guimarães - Matemática em Nivel ITA-IME - Vol. 1.pdf" \
  "$BASE/1. Mat/x. Caio Guimarães/Caio Guimarães - Matemática em Nivel ITA-IME - Vol. 2.pdf" \
  "$BASE/1. Mat/x. Rufino/Rufino - Vol. 1.pdf" \
  "$BASE/1. Mat/x. Rufino/Rufino - Vol. 3.pdf" \
  "$BASE/1. Mat/x. Rufino/Rufino - Vol. 4.pdf" \
  "$BASE/1. Mat/x. Rufino/Rufino - Vol. 5.pdf" \
  "$BASE/1. Mat/x. Rufino/Rufino - Vol. 6 - Cálculo - IR³ - Lógica.pdf" \
  "$BASE/z. Misc/y. Indianos - IIT-JEE/Mathematics for Joint Entrance Examination JEE (Advanced) - Tewani - Cengage/Tewani - JEE Mathematics - Algebra - Daily Practice.pdf" \
  "$BASE/x. Listas, apostilas & simulados/x. Ari de Sá/Matematica 1 - Ari de Sá ITA IME (1)/ITA Por Assunto - Matemática - 2ª E 3ª SÉRIE ITA-IME - ARI_.pdf.pdf" \
  "$BASE/x. Listas, apostilas & simulados/v. Banco de Questões/EFOMM - Banco/Matematica - EFOMM.pdf"
  ;;

"Física")
  qpdfview \
  "$BASE/2. Fís/x. Rufino/Rufino - Elementos da Física Vol. 1.pdf" \
  "$BASE/2. Fís/x. Rufino/Rufino - Elementos da Física Vol. 2.pdf" \
  "$BASE/2. Fís/x. Renato Brito/Fundamentos de Mecânica/Fundamentos de Mecanica - Vol. 1.pdf" \
  "$BASE/2. Fís/x. Moysés/Nussenzveig - Fluidos, Oscilações e Ondas, Calor.pdf" \
  "$BASE/2. Fís/x. Young e Freedman/Física_2_Termodinâmica_e_Ondas_Sears_&_Zemansky;_Young_&_Freedman.pdf" \
  "$BASE/2. Fís/x. Moysés/Nussenzveig - Eletromagnetismo.pdf" \
  "$BASE/2. Fís/x. Tópicos de Física/Tópicos de Física - Vol. 2 - Termologia, Ondulatória e Óptica - 19ª ed - 2012.pdf" \
  "$BASE/2. Fís/x. Tópicos de Física/x. Resoluções (em ordem)/Tópicos de Física 2012 - Resoluções (Vol. 2).pdf" \
  "$BASE/2. Fís/x. Tópicos de Física/Tópicos de Física - Vol. 3 - Eletricidade, Física Moderna e Análise Dimensional - 18ª Ed. 2012.pdf" \
  "$BASE/2. Fís/x. Tópicos de Física/x. Resoluções (em ordem)/Tópicos de Física 2012 - Resoluções (Vol. 3).pdf" \
  "$BASE/2. Fís/Guia Elementar de Fisica - Moderna.pdf" \
  "$BASE/2. Fís/μ. Outros/Trabajo y energía mecánica.pdf" \
  "$BASE/2. Fís/Arvind_Tiwari,_Sachin_Singh_Pathfinder_for_Olympiad_and_JEE_Advanced.pdf" \
  "$BASE/2. Fís/μ. Outros/A_Problem_Book_in_Physics_500_Selected_Problems_for_IIT_JEE_Arihant.pdf" \
  "$BASE/2. Fís/μ. Outros/INSANA/insana.pdf" \
  "$BASE/2. Fís/μ. Outros/INSANA/insana gabarito.pdf" \
  "$BASE/2. Fís/μ. Outros/INSANA/@Solucionário da Insana 2000 Questões.pdf" \
  "$BASE/2. Fís/200 Puzzling Physics Problems.pdf" \
  "$BASE/2. Fís/μ. Outros/SARAEVA,_Irene_Makarovna_Problemas.pdf" \
  "$BASE/2. Fís/μ. Outros/500 problemas resolvidos de ita ime.pdf" \
  "$BASE/x. Listas, apostilas & simulados/x. Ari de Sá/OBF questões.pdf"
  ;;
  
"Química")
  qpdfview \
  "$BASE/3. Quí/x. Feltre/Quimica Feltre - Vol 1.pdf" \
  "$BASE/3. Quí/x. Feltre/Quimica Feltre - Vol 2.pdf" \
  "$BASE/3. Quí/x. Feltre/Quimica Feltre - Vol 3.pdf" \
  "$BASE/3. Quí/μ. Outros/tabela-periodica.pdf" 
  ;;

"Português")
  qpdfview \
  "$BASE/4. Por/1000 Exercícios de Português - EEAr.pdf" \
  "$BASE/4. Por/Aquino - Português Vol. 1 - Questões Comentadas.pdf" \
  "$BASE/4. Por/Novissima Gramatica da Lngua Portuguesa Cegalla .pdf" \
  "$BASE/4. Por/A_Gramática_para_Concursos_Militares_Fernando_Pestana_Copiar.pdf" \
  "$BASE/4. Por/Solucionário Pestana.pdf" \
  "$BASE/x. Listas, apostilas & simulados/v. Banco de Questões/EFOMM - Banco/Portugues - EFOMM.pdf" \
  &

  find "$BASE/x. Listas, apostilas & simulados/x. Estratégia/w. Estratégia Militar - EFOMM/PORTUGUÊS" \
    -type f -iname '*.pdf' -print0 |
    xargs -0 qpdfview &

  anki &
  ;;

"Inglês")
  qpdfview \
  "$BASE/5. Ing/Essential Grammar in Use.pdf" \
  "$BASE/5. Ing/intermediate grammar-in-use.pdf" \
  "$BASE/5. Ing/Advanced_Grammar_in_Use_with_Answers_3rd_Ed_Martin_Hewings.pdf" \
  "$BASE/5. Ing/Nelson Torres Gramática da Língua Inglesa.pdf" \
  "$BASE/5. Ing/592_1.600 Questões de Língua Inglesa - Edição 2014.pdf" \
  "$BASE/x. Listas, apostilas & simulados/x. Ari de Sá/Ingles - Ari de Sá ITA IME/Ingles/Coletanea de Questões/Modulo de Ingles - 4500 Questões de Concursos Militares.pdf" \
  "$BASE/x. Listas, apostilas & simulados/v. Banco de Questões/EFOMM - Banco/Ingles - EFOMM.pdf"
  anki &
  ;;

"Geral")
  qpdfview \
  "$BASE/2. Fís/EFOMM 9 meses.pdf" \
  "$BASE/z. Misc/Guia para Vestibulares Militares.pdf" \
  "$BASE/x. Listas, apostilas & simulados/x. Poliedro/PV - 3ª Série - Livro Único - Revisão ITA IME.pdf"
  ;;

"Desfoco")
  qpdfview \
  "$BASE/1. Mat/Kleber_Daum_Machado_Equações_Diferenciais.pdf" \
  "$BASE/1. Mat/Teoria_dos_numeros_Um_passeio_com_primos_3ed.pdf" \
  "$BASE/1. Mat/μ. Outros/Praticando a Aritmética [Lacerda].pdf" \
  "$BASE/1. Mat/μ. Outros/Lidski - Problemas de Matemática Elementar.pdf" \
  "$BASE/2. Fís/engineering-mechanics-dynamics-7th-edition-j-l-meriam-l-g-kraige.pdf" \
  "$BASE/2. Fís/μ. Outros/Optics - Hecht - 5ed.pdf" \
  "$BASE/2. Fís/μ. Outros/Optics - Eugene Hecht - solutions.pdf" \
  "$BASE/z. Misc/y. Indianos - IIT-JEE/Disha 43 Years JEE Advanced Physics Solutions .pdf" \
  "$BASE/z. Misc/y. Indianos - IIT-JEE/Disha 43 Years JEE Advanced (1978 - 2020) + JEE Main Chapterwise & Topicwise Solved Papers Mathematics PDF.pdf" \
  "$BASE/1. Mat/probabilidade - leorolla.pdf" \
  "$BASE/2. Fís/μ. Outros/Física Matemática - Eugene Butkov.pdf"
  ;;
  

"Música")
  ;;
  
  
esac
