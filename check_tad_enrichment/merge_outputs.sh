python merge_outputs.py --to_merge all_atac_peak_tad_distribution.txt differential_atac_peak_tad_distribution.txt atac_permutations.mean atac_summary.zscores atac_summary.empirical.pvalues all_expressed_gene_tad_distribution.txt differential_expressed_gene_tad_distribution.txt gene_permutations.mean gene_summary.zscores gene_summary.empirical.pvalues \
       --labels ATAC_all_peaks ATAC_diff_peaks ATAC_expected ATAC_zscore ATAC_pvalues_empirical RNA_all_genes RNA_diff_genes RNA_expected RNA_zscore RNA_pvalues_empirical \
       --outf merged_tad_analysis.txt

