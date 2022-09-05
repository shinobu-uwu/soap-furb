namespace Compilador.UI.Componentes.Botoes;

public sealed class BotaoCopiar : BotaoBarraFerramentas
{
    public BotaoCopiar()
    {
        Text = "Copiar";
        ToolTipText = "Copiar (ctrl + c)";
    }

    protected override void OnClick(EventArgs e)
    {
        var texto = FormPrincipal.GetInstancia().TextoEditor.SelectedText;
        
        if (texto != "")
        {
            Clipboard.SetText(texto);
        }

        base.OnClick(e);
    }
}