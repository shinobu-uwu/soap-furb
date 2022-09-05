namespace Compilador.UI.Componentes.Botoes;

public sealed class BotaoRecortar : BotaoBarraFerramentas
{
    public BotaoRecortar()
    {
        Text = "Recortar";
        ToolTipText = "Recortar (ctrl + x)";
    }

    protected override void OnClick(EventArgs e)
    {
        var form = FormPrincipal.GetInstancia();
        
        if (form.TextoEditor.SelectedText == "")
        {
            base.OnClick(e);
            return;
        }

        var textoEditor = form.TextoEditor;
        Clipboard.SetText(textoEditor.SelectedText);
        var textoEditorSelectionStart = textoEditor.SelectionStart;
        var novoTexto = textoEditor.Text.Remove(textoEditorSelectionStart, textoEditor.SelectionLength);
        textoEditor.Text = novoTexto;

        base.OnClick(e);
    }
}