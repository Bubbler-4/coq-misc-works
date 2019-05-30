(* https://stackoverflow.com/questions/55333331/coq-proof-that-factorial-n-factorial-k-factorial-n-k-is-integer/55944121#55944121 *)

From Coq Require Import Arith.

(* Let's prove that (n+m)! is divisible by n! * m!. *)

(* fact2 x y = (x+1) * (x+2) * .. * (x+y) *)

Fixpoint fact2 x y := match y with
  | O => 1
  | S y' => (x + y) * fact2 x y'
end.

Lemma fact2_0 : forall x, fact2 0 x = fact x.
Proof.
  induction x.
  - auto.
  - simpl. rewrite IHx. auto. Qed.

Lemma fact_fact2 : forall x y, fact x * fact2 x y = fact (x + y).
Proof.
  induction x.
  - intros. simpl. rewrite fact2_0. ring.
  - induction y.
    + simpl. replace (x + 0) with x by ring. ring.
    + simpl. replace (x + S y) with (S x + y) by ring. rewrite <- IHy. simpl. ring. Qed.

Lemma fact2_left : forall x y, fact2 x (S y) = S x * fact2 (S x) y.
Proof. intros x y. generalize dependent x. induction y.
  - intros. simpl. ring.
  - intros. unfold fact2. fold (fact2 x (S y)). fold (fact2 (S x) y).
    rewrite IHy. ring. Qed.

Lemma fact_div_fact2 : forall x y, exists e, fact2 x y = e * fact y.
Proof. intros x y. generalize dependent x. induction y.
  - intros. simpl. exists 1. auto.
  - induction x.
    + unfold fact2. fold (fact2 0 y). unfold fact. fold (fact y). destruct (IHy 0). rewrite H.
      exists x. ring.
    + unfold fact2. fold (fact2 (S x) y).
      destruct (IHy (S x)). destruct IHx. exists (x0 + x1).
      replace ((S x + S y) * fact2 (S x) y) with (S x * fact2 (S x) y + S y * fact2 (S x) y) by ring.
      rewrite <- fact2_left. rewrite H0. rewrite H.
      replace (S y * (x0 * fact y)) with (x0 * (S y * fact y)) by ring.
      unfold fact. fold (fact y). ring. Qed.

Theorem fact_div_fact_fact : forall x y, exists e, fact (x + y) = e * (fact x * fact y).
Proof. intros x y. destruct (fact_div_fact2 x y). exists x0.
  rewrite <- fact_fact2. rewrite H. ring. Qed.
