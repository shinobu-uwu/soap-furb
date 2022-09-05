using Compilador.UI.Componentes.Botoes;

namespace Compilador.UI.Componentes;

public sealed class BarraFerramentas : MenuStrip
{
    private const int Altura = 70;

    public BotaoNovo BotaoNovo = new();
    public BotaoAbrir BotaoAbrir = new();
    public BotaoSalvar BotaoSalvar = new();
    public BotaoCopiar BotaoCopiar = new();
    public BotaoColar BotaoColar = new();
    public BotaoRecortar BotaoRecortar = new();
    public BotaoCompilar BotaoCompilar = new();
    public BotaoEquipe BotaoEquipe = new();

    public BarraFerramentas()
    {
        BackColor = Color.White;
        Anchor = AnchorStyles.Top | AnchorStyles.Left;
        Location = new Point(0, 0);
        Size = new Size(ClientSize.Width, Altura);
        AddBotoes();
    }

    private void AddBotoes()
    {
        Items.Add(BotaoNovo);
        Items.Add(BotaoAbrir);
        Items.Add(BotaoSalvar);
        Items.Add(BotaoCopiar);
        Items.Add(BotaoColar);
        Items.Add(BotaoRecortar);
        Items.Add(BotaoCompilar);
        Items.Add(BotaoEquipe);
    }
}