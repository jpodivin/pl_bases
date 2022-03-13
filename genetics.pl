/* Facts */

/*
   Genetic alphabet.

   A - Adenine
   T - Thymine
   C - Citosine
   G - Guanine
   U - Uracil - But only for RNA
*/
base(adenine).
base(thymine).
base(citosine).
base(guanine).
base(uracil).

th_ur(X):-uracil=X; thymine=X.

binds(adenine, thymine).
binds(citosine, guanine).
binds(uracil, adenine).

/* DNA */
nucleic_acid(dna, adenine).
nucleic_acid(dna, citosine).
nucleic_acid(dna, guanine).
nucleic_acid(dna, thymine).

/* RNA */
nucleic_acid(rna, uracil).
nucleic_acid(rna, adenine).
nucleic_acid(rna, citosine).
nucleic_acid(rna, guanine).

/* Codons  */
codon(X, Y, Z):-base(X),
                base(Y),
                base(Z).
/* Stop codons */
stop_codon(X, Y, Z):-codon(X, Y, Z),
                     th_ur(X),
                     ((Y=guanine, Z=adenine); (Y=adenine, (Z=adenine; Z=guanine))).
/* Amino Acids */

/* Valine */
a_acid_code(valine, guanine, X, Z):-base(Z),th_ur(X).

/* Alanine */
a_acid_code(alanine, guanine, citosine, Z):-base(Z).

/* Glycine */
a_acid_code(glycine, guanine, guanine, Z):-base(Z).

/* Phenylalanine */
a_acid_code(phenylalanine, X, X, Z):-th_ur(X), (X=Z; citosine=Z).

/* Leucine */
a_acid_code(leucine, Y, uracil, Z):-(uracil=Y, (adenin=Z; guanine=Z)); (citosine=Y, base(Z)). 

/* Isoleucine */
a_acid_code(isoleucine, adenin, W, X):-th_ur(W), (th_ur(X); adenine=X; citosine=X).

/* Threonine */
a_acid_code(threonine, adenine, citosine, Z):-base(Z).

/* Methionine */
a_acid_code(methionine, adenine, X, guanine):-th_ur(X).

/* Serine */
a_acid_code(serine, X, citosine, Y):-th_ur(X), ((base(Y), not(th_ur(Y))); Y=X).
a_acid_code(serine, adenine, guanine, X):-th_ur(X); citosine=X.

/* Proline */
a_acid_code(proline, citosine, citosine, X):-base(X).

/* Tyrosine */
a_acid_code(tyrosine, X, adenine, Y):-th_ur(X), (X=Y; citosine=Y).

/* Histidine */
a_acid_code(histidine, citosine, adenine, X):-th_ur(X); citosine=X.

/* Glutamine */
a_acid_code(glutamine, citosine, adenine, X):-adenine=X; guanine=X.

/* Asparagine */
a_acid_code(asparagine, adenine, adenine, X):-th_ur(X); citosine=X.

/* Lysine */
a_acid_code(lysine, adenine, adenine, X):-adenine=X; guanine=X.

/* Asparatic Acid */
a_acid_code(asparatic_acid, guanine, adenine, X):-th_ur(X); citosine=X.

/* Glutamic Acid */
a_acid_code(glutamic_acid, guanine, adenine, X):-guanine=X; adenine=X.

/* Cysteine */
a_acid_code(cysteine, X, guanine, Y):-th_ur(X), (citosine=Y; X=Y).

/* Tryptophan */
a_acid_code(tryptophan, X, guanine, guanine):-th_ur(X).

/* Arginine */
a_acid_code(arginine, citosine, guanine, X):-base(X).
a_acid_code(arginine, adenine, guanine, X):-adenine=X; guanine=X.

/*Helix def*/

