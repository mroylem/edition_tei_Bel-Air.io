# Commentaire sur l'encodage TEI

Ce document détaille les choix méthodologiques, les règles d'encodage et la politique éditoriale appliqués lors de l'édition numérique des *Procès-verbaux de la Commission Administrative de Bel-Air- Commencé le 9 juillet 1907. Terminé le 9 mai 1916.*.

---

## Contexte & Périmètre du projet
* **Cadre académique :** Séminaire *Bibliothèque numérique II - Éditions et corpus numériques*, Université de Genève (UNIGE).
* **Périmètre éditorial :** Édition numérique en TEI appliquée aux **pages 183 à 185** du registre manuscrit.

---

## Principes éditoriaux (`<editorialDecl>`)

### 1. Orthographe, grammaire et ponctuation
* **Maintien de l'original :** Conservation stricte de l'orthographe d'origine, y compris les variations graphiques et les archaïsmes, sans modernisation.
* **Ponctuation :** La ponctuation est modernisée ponctuellement lorsque cela est nécessaire pour faciliter la compréhension du texte.
* **Accentuations :** Des accents toniques ou de clarification sont ajoutés selon les besoins de la lecture.

### 2. Dates
* Les dates mentionnées sont encodées à l'aide de la balise `<date>` associée à un attribut `@when` au format ISO 8601 (`AAAA-MM-JJ`).

### 3. Normalisation & Abréviations (`<normalization>`)
* **Conservation des abréviations :** Les abréviations d'origine (ex. *M.*, *D.* surmontées d'un tiret ou d'une lettre) sont conservées sous leur forme originale sans être développées. Les lettres en exposant sont représentées par un accent circonflexe (`^`) dans la transcription (ex. `M^r`, `D^elle`).
* **Signes de répétition :** Les signes de répétition (*" "*) utilisés par le scripteur pour éviter de réécrire un terme identique sont remplacés dans la transcription par le mot attendu, signalé et justifié par une note explicative (`<note>`).

### 4. Corrections et interventions du scripteur (`<correction>`)
* **Ratures et suppressions :** La balise `<del>` est utilisée pour signaler un passage raturé ou biffé dans le manuscrit.
* **Ajouts :** La balise `<add>` est utilisée pour indiquer un mot ou un passage rajouté dans l'interligne ou la marge.

---

## Structuration & Mise en page (`<segmentation>`)

* **Division par page :** Chaque page du registre est structurée par un élément `<div>` portant un attribut `@xml:id` correspondant au numéro de page.
* **Sauts de page (`<pb>`) :** Les sauts de page sont matérialisés par la balise `<pb>` pour permettre une mise en vis-à-vis exacte avec les fac-similés.
* **Retours à la ligne (`<lb>`) :** Chaque retour à la ligne du manuscrit est indiqué par la balise `<lb>` afin de préserver la structure visuelle originale du document.
* **Paragraphes (`<p>`) :** Le découpage en paragraphes du texte original est strictement respecté.
* **Intitulés de marge (`<label>`) :** Les titres et mentions inscrits dans les marges du registre sont balisés avec `<label place="margin-left">`.

---

## Statistiques et balisage sémantique (`<tagsDecl>`)

| Balise TEI | Occurrences | Description / Usage |
| :--- | :---: | :--- |
| `<placeName>` | **7** | Identification et encadrement des noms de lieux et localisations. |
| `<persName>` | **5** | Identification et encadrement des personnes citées. |
| `<date>` | **3** | Normalisation des dates historiques mentionnées. |