namespace Compilador.UI.Componentes.Botoes;

public class BotaoColar : BotaoBarraFerramentas
{
    public BotaoColar()
    {
        Text = "Colar";
        ToolTipText = "Colar (ctrl + v)";
    }

    protected override void OnClick(EventArgs e)
    {
        var textoEditor = FormPrincipal.GetInstancia().TextoEditor;
        textoEditor.Text = textoEditor.Text.Insert(textoEditor.SelectionStart, Clipboard.GetText());
        
        base.OnClick(e);
    }
}