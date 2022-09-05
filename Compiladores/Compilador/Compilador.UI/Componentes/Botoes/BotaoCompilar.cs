namespace Compilador.UI.Componentes.Botoes;

public sealed class BotaoCompilar : BotaoBarraFerramentas
{
    public BotaoCompilar()
    {
        Text = "Compilar";
        ToolTipText = "Compilar arquivo (F7)";
    }

    protected override void OnClick(EventArgs e)
    {
        FormPrincipal.GetInstancia().AreaMensagens.EscreverMensagem("Função não implementada");
        base.OnClick(e);
    }
}