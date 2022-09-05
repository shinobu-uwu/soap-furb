namespace Compilador.UI.Componentes.Botoes;

public sealed class BotaoNovo : BotaoBarraFerramentas
{
    public BotaoNovo()
    {
        Text = "Novo";
        ToolTipText = "Criar novo arquivo (ctrl + n)";

        Click += (sender, args) =>
        {
            var dialog = new SaveFileDialog();

            if (dialog.ShowDialog() == DialogResult.OK)
            {
                var form = FormPrincipal.GetInstancia();
                form.BarraStatus.Text = dialog.FileName;
                File.WriteAllText(dialog.FileName, "");
            }
        };
    }
}