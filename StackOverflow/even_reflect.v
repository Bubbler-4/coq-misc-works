Inductive even : nat -> Prop :=
| ev_0 : even 0
| ev_SS (n : nat) (H : even n) : even (S (S n)).

Inductive reflect (P : Prop) : bool -> Prop :=
| ReflectT (H : P) : reflect P true
| ReflectF (H : ~ P) : reflect P false.

Fixpoint evenb (n:nat) : bool :=
  match n with
  | O => true
  | S O => false
  | S (S n') => evenb n'
  end.

Lemma nat_ind2 :
  forall P : nat -> Prop,
  P 0 -> P 1 ->
  (forall n : nat, P n -> P (S (S n))) ->
  forall n : nat, P n.
Proof. fix IH 5. intros. destruct n as [| [| ]]; auto.
  apply H1. apply IH; auto. Qed.

Lemma negb_involutive : forall x : bool, negb (negb x) = x.
Proof. intros []; auto. Qed.

Lemma evenb_S : forall n : nat, evenb (S n) = negb (evenb n).
Proof. induction n.
  - auto. - rewrite IHn. simpl. destruct (evenb n); auto. Qed.

Lemma evenb_even : forall n : nat, evenb n = true -> even n.
Proof. induction n using nat_ind2.
  - constructor.
  - discriminate.
  - intros. constructor. apply IHn. auto. Qed.

Lemma evenb_odd : forall n : nat, evenb n = false -> ~ (even n).
Proof. induction n using nat_ind2.
  - discriminate.
  - intros H H0. inversion H0.
  - intros H H0. inversion_clear H0; subst. apply IHn; auto. Qed.

Lemma even_reflect : forall n : nat, reflect (even n) (evenb n).
Proof. intros. destruct (evenb n) eqn:E; constructor; auto using evenb_even, evenb_odd. Qed.

Theorem reflect_iff : forall P b, reflect P b -> (P <-> b = true).
Proof. split; intros.
  - destruct b; auto. inversion H. contradiction.
  - rewrite H0 in H. inversion H. auto. Qed.

Theorem reflect_iff_false : forall P b, reflect P b -> (~ P <-> b = false).
Proof. split; intros.
  - destruct b; auto. inversion H. contradiction.
  - rewrite H0 in H. inversion H. auto. Qed.

Lemma even_iff_evenb : forall n, even n <-> evenb n = true.
Proof. intros n. apply reflect_iff. apply even_reflect. Qed.

Lemma n_even_iff_evenb : forall n, ~ (even n) <-> evenb n = false.
Proof. intros n. apply reflect_iff_false. apply even_reflect. Qed.

Lemma even_Sn_not_even_n : forall n,
    even (S n) <-> not (even n).
Proof. split; intros.
  - intros H0. apply even_iff_evenb in H. apply even_iff_evenb in H0.
    rewrite evenb_S in H. rewrite H0 in H. discriminate.
  - apply even_iff_evenb. apply n_even_iff_evenb in H.
    rewrite evenb_S. rewrite H. auto. Qed.
