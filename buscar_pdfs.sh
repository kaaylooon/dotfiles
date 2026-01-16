#!/usr/bin/env bash
# buscar_pdfs_terminal.sh — Versão com busca e lolcat opcional

DIR="$HOME/Documents/Everythingineed"
VIEWERS=(qpdfview evince zathura xdg-open mupdf)

# Verifica se lolcat está disponível
if command -v lolcat >/dev/null 2>&1; then
    HAS_LOLCAT=true
else
    HAS_LOLCAT=false
fi

# Função para output colorido (com ou sem lolcat)
say() {
    if $HAS_LOLCAT; then
        echo "$@" | lolcat
    else
        echo "$@"
    fi
}

# Função para título
title() {
    echo -e "\n"
    if $HAS_LOLCAT; then
        echo "=== $1 ===" | lolcat
    else
        echo "=== $1 ==="
    fi
    echo
}

# Função para linha de separação
separator() {
    if $HAS_LOLCAT; then
        echo "----------------------------------------" | lolcat
    else
        echo "----------------------------------------"
    fi
}

# Limpa a tela para começar
clear

title "BUSCADOR DE PDFs"
echo "Diretório: $DIR"
separator

if [ ! -d "$DIR" ]; then
    say "ERRO: Pasta não encontrada: $DIR"
    exit 1
fi

# Pede termo de busca
echo
say "Digite parte do nome do PDF:"
echo "(deixe vazio para listar todos)"
echo -n "🔍 Buscar: "
read -r busca

# Busca arquivos PDF com filtro
FILES=()
if [ -z "$busca" ]; then
    # Busca todos
    while IFS= read -r -d $'\0' file; do
        FILES+=("$file")
    done < <(find "$DIR" -type f -iname '*.pdf' -print0 | sort -z)
else
    # Busca com filtro
    while IFS= read -r -d $'\0' file; do
        FILES+=("$file")
    done < <(find "$DIR" -type f -iname '*.pdf' -iname "*${busca}*" -print0 | sort -z)
    
    # Fallback: busca no nome do arquivo
    if [ ${#FILES[@]} -eq 0 ]; then
        while IFS= read -r -d $'\0' file; do
            filename=$(basename "$file")
            if [[ "${filename,,}" == *"${busca,,}"* ]]; then
                FILES+=("$file")
            fi
        done < <(find "$DIR" -type f -iname '*.pdf' -print0 | sort -z)
    fi
fi

if [ ${#FILES[@]} -eq 0 ]; then
    echo
    say "Nenhum PDF encontrado"
    [ -n "$busca" ] && say "com o termo: '$busca'"
    exit 0
fi

separator
say "📚 ${#FILES[@]} PDF(s) encontrado(s)"
[ -n "$busca" ] && echo "Termo: '$busca'"
separator

# Mostra lista numerada
for i in "${!FILES[@]}"; do
    short="${FILES[$i]/$DIR\//}"
    printf "%3d) %s\n" $((i+1)) "$short"
done

# Se tem vários, pede seleção
SELECTED=()
if [ ${#FILES[@]} -gt 1 ]; then
    separator
    say "Selecione os PDFs para abrir:"
    echo "Ex: 1 3 5   ou   2-4   ou   a (todos)"
    echo -n "📝 Seleção: "
    
    read -r selection
    
    if [[ "$selection" =~ ^[aAtT]$ ]] || [[ "$selection" == "todos" ]] || [[ "$selection" == "all" ]]; then
        SELECTED=("${FILES[@]}")
        say "Selecionados: TODOS"
    else
        # Processa seleção
        IFS=', ' read -ra PARTS <<< "$selection"
        
        for part in "${PARTS[@]}"; do
            if [[ "$part" =~ ^([0-9]+)-([0-9]+)$ ]]; then
                start="${BASH_REMATCH[1]}"
                end="${BASH_REMATCH[2]}"
                for ((i=start; i<=end; i++)); do
                    idx=$((i-1))
                    if (( idx >= 0 && idx < ${#FILES[@]} )); then
                        SELECTED+=("${FILES[idx]}")
                    fi
                done
            elif [[ "$part" =~ ^[0-9]+$ ]]; then
                idx=$((part-1))
                if (( idx >= 0 && idx < ${#FILES[@]} )); then
                    SELECTED+=("${FILES[idx]}")
                fi
            fi
        done
    fi
else
    # Só tem 1 arquivo
    SELECTED=("${FILES[@]}")
    say "Único arquivo encontrado. Abrindo..."
fi

# Se seleção inválida, usa todos
if [ ${#SELECTED[@]} -eq 0 ]; then
    SELECTED=("${FILES[@]}")
    say "⚠️  Seleção inválida. Abrindo todos."
fi

# Remove duplicatas
if [ ${#SELECTED[@]} -gt 0 ]; then
    mapfile -t SELECTED < <(printf "%s\n" "${SELECTED[@]}" | sort -u)
fi

separator
say "🚀 Abrindo ${#SELECTED[@]} arquivo(s):"

for file in "${SELECTED[@]}"; do
    short="${file/$DIR\//}"
    echo "  📄 $short"
done

# Tenta abrir com viewer disponível
for viewer in "${VIEWERS[@]}"; do
    if command -v "$viewer" >/dev/null 2>&1; then
        echo
        say "Abrindo com: $viewer"
        
        for file in "${SELECTED[@]}"; do
            setsid "$viewer" "$file" >/dev/null 2>&1 &
            sleep 0.05  # Pequena pausa mínima
        done
        
        separator
        say "✅ Concluído!"
        echo "Arquivos abertos em segundo plano."
        exit 0
    fi
done

# Se chegou aqui, nenhum viewer encontrado
separator
say "❌ ERRO: Nenhum visualizador de PDF encontrado!"
echo "Instale um destes:"
echo "  • zathura"
echo "  • evince"
echo "  • qpdfview"
echo "  • mupdf"
exit 1