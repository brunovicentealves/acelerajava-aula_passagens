package domain;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "localidade")
public class Localidade {
    @Id
    @GeneratedValue(generator = "Sequence_localidade",strategy = GenerationType.AUTO)
    @Column(name = "id_localidade")
    private  long idLocalidade;

    @Column(name = "sigla_localidade")
    private String siglaLocalidade;

    @Column(name = "nome_localidade")
    private String nomeLocalidade;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "localidadeOrigem")
    private List<Voo> origemVoos;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "localidadeDestino")
    private List<Voo> destinoVoos;

    public long getIdLocalidade() {
        return idLocalidade;
    }

    public void setIdLocalidade(long idLocalidade) {
        this.idLocalidade = idLocalidade;
    }

    public String getSiglaLocalidade() {
        return siglaLocalidade;
    }

    public void setSiglaLocalidade(String siglaLocalidade) {
        this.siglaLocalidade = siglaLocalidade;
    }

    public String getNomeLocalidade() {
        return nomeLocalidade;
    }

    public void setNomeLocalidade(String nomeLocalidade) {
        this.nomeLocalidade = nomeLocalidade;
    }

    public List<Voo> getOrigemVoos() {
        return origemVoos;
    }

    public void setOrigemVoos(List<Voo> origemVoos) {
        this.origemVoos = origemVoos;
    }

    public List<Voo> getDestinoVoos() {
        return destinoVoos;
    }

    public void setDestinoVoos(List<Voo> destinoVoos) {
        this.destinoVoos = destinoVoos;
    }
}
