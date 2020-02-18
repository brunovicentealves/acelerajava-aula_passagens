package domain;

import javax.persistence.*;

@Entity
@Table(name = "voo")
public class Voo {
    @Id
    @GeneratedValue(generator = "sequence_voo",strategy = GenerationType.AUTO)
    @Column(name="id_voo")
    private long idVoo;

    @ManyToOne
    @JoinColumn(name = "id_localidade_origem")
    private Localidade localidadeOrigem;

    @ManyToOne
    private Localidade localidadeDestino;

    @Column(name="capacidade")
    private int capacidade;

    @Column(name="preco")
    private double preco;

    @Column(name="qtdMilhas")
    private long qtdMilhas;
}
