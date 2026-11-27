Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759991;
	b=FE5zr5cXIwelVMekyewQSjUluFgpgHYUKKog5J7h63CvlLDT8e8StsooKGR8KwycN+QU
	 +KfGT0G9gphYw4iwviP4BlXRkaMPF14giEgDBNNfEEooUrjyyfIIf6Hqc5xuUQKmguiQY
	 of/kbV+jdmNruVYoOQfkM3gmOYUWgE8QgAWJ9DgenwdArOjtKLO0izVN9WtWUXq3D8HVY
	 C8jcU3bBCl2Ab05gqYO6r7x1EIldh8OBXSXiq1YkhqAHrzpw23e4hyRDVoD06sOsVjnHK
	 KJRQF2yoYSD6JEbyRF5mT9HTY3YRlm5ZzrIPF0TypjqxsUazAc7Rq3ffAYfFqTBfR9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CbXtIzR5DloxSSu068zvn1515nv+q3/JPdm8QX/W5Wo=;
	b=ZBCLetC0/MviuCpZANUKLD3pr9sWSTLLnuEKtk8a8EIcwsaj46gv4OfhCMT09AxrXSUt
	 j9Ks/8wuFEJwhCO3RMnnARRGNOk4XV9YM1IYgWT3kEjQssxXsdVOEHPg8fKL8p4TQ6Buo
	 vwtVDcnhM0n6Z9EXvs2MsV9awzpkgvXliobCnDPb908P8qFpf+zFyzYRRIIQHQ9o2qQfU
	 Eedbs5KkjzUJKOp/F2XK6dpTlP1viu0us7fg0DGy3DkxgvShTPKPLmNv++oc/0DryelHG
	 5GQbUZ1HYcOj8lZmztd+BEXdxPIdybUdRh/cMpf9iKjD7DWeVYKxFW1EMck0VFq1dCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7kpdyU8;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66475606A31C
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 06:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66475606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7kpdyU8
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38190551625so14850443eec.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 22:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759989; x=1796364789; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbXtIzR5DloxSSu068zvn1515nv+q3/JPdm8QX/W5Wo=;
        b=r7kpdyU85/vGduq/4J2I/hZKkg5CA9hRxrAB3+gSVvIWnxE9uoXvq7KI1lReXsbbHU
         MGEhFvo9aQDiw0Bdj2cxncIR/x/bLQtAIm4rmR+1t33qKCzcAFqEG5/t3zuh0n7CRgeA
         AZgdr9dhldlyhpLoEisRRyK2We/TOzaSCI4q3DYefOeM6GcvhP9W8olbQF+tURTJV/cN
         EyM/0KQVqBpGAm6jDntLStLx/g/zvRT5CXYkkoURIO35E9DH3zwnK8q6+7Pbx/OZ97ny
         soUGJQFan53Te1WQFiw63A+SEdJZ7W3dsDyg9nftcq+xI1mUQ8KKh3q5WtOGloiPATOz
         RfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759989; x=1796364789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbXtIzR5DloxSSu068zvn1515nv+q3/JPdm8QX/W5Wo=;
        b=xVcl9Qqd1FjjFuBEKSB3OvIjQp+ZSD3MU/12hanOABRjAbeEjwhlC8GtCEJFNxP1zO
         oWVXvCr8xITrlGWRy78zjxKEXWyg5brdP7kAlR2g6o02ENqsjvAl0ORUwHyIde6LOfGq
         a7OUrAdhB7loGlf0o8nL26xJGpnoy9ecZh66hTe0dAqqxkEpRMaMi469NzyzHV427/Zg
         wkUewR7mfkA5Bn31IIaRpduffxF6be7O6D0CSarNff3v/c9m1uHqHsAqHm15zFYKvq66
         7LkPF6SwCJpVwcnbAsREowX9zTvON5Y8BtVDXRahENjqj+uRm0dQugZHV8uxR05FlM4X
         CrcA==
X-Forwarded-Encrypted: i=1; AL+hErGipG4mvFcT1/ZznykJptvXXP9/Ljfu6/DhGHlR6Ht7U2OnJ6Rvjq45BcBVvkqvKMF4lS8VRTvl41w=@lists.linux.dev
X-Gm-Message-State: APuU4Z+KoNgX9xppN0Ap714caT3HQcMNk5nn+vY791PtH8zd+LDlI4jY
	ec2LOLCXb1A4UVCOzT8eXGZGP7DvKGC+m06n5VF3g2nRkCWQ5A+tkilL
X-Gm-Gg: AZFdTZdff3E41WzxhKWAu08OhirKLtzXrR4DhMtO7g1qaKzxvalb2udIJfr1eQJa1Ns
	PPYIZN58aMjjFo0ggVoBQoymMQBH0D6k93I6o0P4P33z0bqeOKheJHjpr8hmp5xBMnVkX0QYRgR
	q42j1rmjJyT2lWjHFm2uXTzfReCFGlamMQDv0SYrMKbS3k1uSFZz3z8aOGKeRT41RufP1sNEAaq
	fm3uGuGEyf7beXYnHDb9dnA54jFYh3mSx6oQ7RnKzFH215PZn9y5zkEw2IuzIDeNcJn9zuPxERk
	pEdDOvB5JgZPazJAIbWHt5VFyssfRcD7Djl82276HWdLeK6b1ZIZt0zRNEhS531+tAqT7Q+F0mR
	t+ZN6eU40I7dyFnJpFsOCNeRcw96UhDXu7O6n8ZMRbl9nE9xw1IoWy+A/DyWsGtfez1j9+YCmpm
	pdk3A/9gmkmdUoheQWn3SaJ1AgFa5OCZhgUx6aC0eFzAM5RfP7g9Sf7Os4obblAGtU37ofOwFd8
	Bd+5IkuCiNHFe2sOa0279qzsKyZcx9NVww8Y9/1ZkX+LiUcOtSsxt0RXkL8InGi2B5a305VoB15
	8yQ46be7tHYrX+haUjm5c6pzM51o1TziVQqspvomWPs8ajRyUbzLBOKwJLW6mjViHLTFfw==
X-Received: by 2002:a05:7301:182:b0:386:b4db:74d3 with SMTP id 5a478bee46e88-386b4db7924mr13499189eec.21.1795759989041;
        Thu, 26 Nov 2026 22:13:09 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:08 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 04/11] wifi: brcmsmac: give the rate tables and helpers a brcmu_ prefix
Date: Fri, 27 Nov 2026 14:11:34 +0800
Message-ID: <20261127061147.506129-5-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare rate.c for move to brcmutil, which exports them.
Rename brcms_c_ to brcmu_.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/main.c        | 87 +++++++++---------
 .../broadcom/brcm80211/brcmsmac/rate.c        | 88 +++++++++----------
 .../broadcom/brcm80211/brcmsmac/rate.h        | 68 +++++++-------
 3 files changed, 121 insertions(+), 122 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 7d000a2d03..46116d66f3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -347,7 +347,7 @@ static u8 brcms_fifo_to_ac(u8 fifo)
 static u8 brcms_basic_rate(struct brcms_c_info *wlc, u32 rspec)
 {
 	if (is_mcs_rate(rspec))
-		return wlc->band->basic_rate[mcs_table[rspec & RSPEC_RATE_MASK]
+		return wlc->band->basic_rate[brcmu_mcs_table[rspec & RSPEC_RATE_MASK]
 		       .leg_ofdm];
 	return wlc->band->basic_rate[rspec & RSPEC_RATE_MASK];
 }
@@ -3356,11 +3356,11 @@ static void brcms_c_set_phy_chanspec(struct brcms_c_info *wlc,
 static void
 brcms_default_rateset(struct brcms_c_info *wlc, struct brcms_c_rateset *rs)
 {
-	brcms_c_rateset_default(rs, NULL, wlc->band->phytype,
-		wlc->band->bandtype, false, BRCMS_RATE_MASK_FULL,
-		(bool) (wlc->pub->_n_enab & SUPPORT_11N),
-		brcms_chspec_bw(wlc->default_bss->chanspec),
-		wlc->stf->txstreams);
+	brcmu_rateset_default(rs, NULL, wlc->band->phytype,
+			      wlc->band->bandtype, false, BRCMS_RATE_MASK_FULL,
+			      (bool)(wlc->pub->_n_enab & SUPPORT_11N),
+			      brcms_chspec_bw(wlc->default_bss->chanspec),
+			      wlc->stf->txstreams);
 }
 
 /* derive wlc->band->basic_rate[] table from 'rateset' */
@@ -3491,9 +3491,9 @@ static void brcms_c_bandinit_ordered(struct brcms_c_info *wlc,
 		brcms_default_rateset(wlc, &default_rateset);
 
 		/* fill in hw_rate */
-		brcms_c_rateset_filter(&default_rateset, &wlc->band->hw_rateset,
-				   false, BRCMS_RATES_CCK_OFDM, BRCMS_RATE_MASK,
-				   (bool) (wlc->pub->_n_enab & SUPPORT_11N));
+		brcmu_rateset_filter(&default_rateset, &wlc->band->hw_rateset,
+				     false, BRCMS_RATES_CCK_OFDM, BRCMS_RATE_MASK,
+				     (bool)(wlc->pub->_n_enab & SUPPORT_11N));
 
 		/* init basic rate lookup */
 		brcms_c_rate_lookup_init(wlc, &default_rateset);
@@ -3578,8 +3578,8 @@ static void brcms_c_write_rate_shm(struct brcms_c_info *wlc, u8 rate,
 	 * for a given rate, the LS-nibble of the PLCP SIGNAL field is
 	 * the index into the rate table.
 	 */
-	phy_rate = rate_info[rate] & BRCMS_RATE_MASK;
-	basic_phy_rate = rate_info[basic_rate] & BRCMS_RATE_MASK;
+	phy_rate = brcmu_rate_info[rate] & BRCMS_RATE_MASK;
+	basic_phy_rate = brcmu_rate_info[basic_rate] & BRCMS_RATE_MASK;
 	index = phy_rate & 0xf;
 	basic_index = basic_phy_rate & 0xf;
 
@@ -3601,13 +3601,13 @@ brcms_c_rateset_get_hwrs(struct brcms_c_info *wlc)
 
 	if (BRCMS_PHY_11N_CAP(wlc->band)) {
 		if (wlc->band->bandtype == BRCM_BAND_5G)
-			rs_dflt = &ofdm_mimo_rates;
+			rs_dflt = &brcmu_ofdm_mimo_rates;
 		else
-			rs_dflt = &cck_ofdm_mimo_rates;
+			rs_dflt = &brcmu_cck_ofdm_mimo_rates;
 	} else if (wlc->band->gmode)
-		rs_dflt = &cck_ofdm_rates;
+		rs_dflt = &brcmu_cck_ofdm_rates;
 	else
-		rs_dflt = &cck_rates;
+		rs_dflt = &brcmu_cck_rates;
 
 	return rs_dflt;
 }
@@ -3621,8 +3621,8 @@ static void brcms_c_set_ratetable(struct brcms_c_info *wlc)
 
 	rs_dflt = brcms_c_rateset_get_hwrs(wlc);
 
-	brcms_c_rateset_copy(rs_dflt, &rs);
-	brcms_c_rateset_mcs_upd(&rs, wlc->stf->txstreams);
+	brcmu_rateset_copy(rs_dflt, &rs);
+	brcmu_rateset_mcs_upd(&rs, wlc->stf->txstreams);
 
 	/* walk the phy rate table and update SHM basic rate lookup table */
 	for (i = 0; i < rs.count; i++) {
@@ -3889,8 +3889,9 @@ static void brcms_c_set_chanspec(struct brcms_c_info *wlc, u16 chanspec)
 		/* Fix the hardware rateset based on bw.
 		 * Mainly add MCS32 for 40Mhz, remove MCS 32 for 20Mhz
 		 */
-		brcms_c_rateset_bw_mcs_filter(&wlc->band->hw_rateset,
-			wlc->band->mimo_cap_40 ? brcms_chspec_bw(chanspec) : 0);
+		brcmu_rateset_bw_mcs_filter(&wlc->band->hw_rateset,
+					    wlc->band->mimo_cap_40 ?
+					    brcms_chspec_bw(chanspec) : 0);
 	}
 
 	/* update some mac configuration since chanspec changed */
@@ -4707,10 +4708,10 @@ static void brcms_c_bss_default_init(struct brcms_c_info *wlc)
 		band = wlc->bandstate[OTHERBANDUNIT(wlc)];
 
 	/* init bss rates to the band specific default rate set */
-	brcms_c_rateset_default(&bi->rateset, NULL, band->phytype,
-		band->bandtype, false, BRCMS_RATE_MASK_FULL,
-		(bool) (wlc->pub->_n_enab & SUPPORT_11N),
-		brcms_chspec_bw(chanspec), wlc->stf->txstreams);
+	brcmu_rateset_default(&bi->rateset, NULL, band->phytype,
+			      band->bandtype, false, BRCMS_RATE_MASK_FULL,
+			      (bool)(wlc->pub->_n_enab & SUPPORT_11N),
+			      brcms_chspec_bw(chanspec), wlc->stf->txstreams);
 
 	if (wlc->pub->_n_enab & SUPPORT_11N)
 		bi->flags |= BRCMS_BSS_HT;
@@ -5202,7 +5203,7 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 	switch (gmode) {
 	case GMODE_LEGACY_B:
 		shortslot = BRCMS_SHORTSLOT_OFF;
-		brcms_c_rateset_copy(&gphy_legacy_rates, &rs);
+		brcmu_rateset_copy(&brcmu_gphy_legacy_rates, &rs);
 
 		break;
 
@@ -5235,7 +5236,7 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 
 	/* Use the default 11g rateset */
 	if (!rs.count)
-		brcms_c_rateset_copy(&cck_ofdm_rates, &rs);
+		brcmu_rateset_copy(&brcmu_cck_ofdm_rates, &rs);
 
 	if (ofdm_basic) {
 		for (i = 0; i < rs.count; i++) {
@@ -5272,8 +5273,8 @@ int brcms_c_set_nmode(struct brcms_c_info *wlc)
 		wlc->pub->_n_enab = SUPPORT_11N;
 	wlc->default_bss->flags |= BRCMS_BSS_HT;
 	/* add the mcs rates to the default and hw ratesets */
-	brcms_c_rateset_mcs_build(&wlc->default_bss->rateset,
-			      wlc->stf->txstreams);
+	brcmu_rateset_mcs_build(&wlc->default_bss->rateset,
+				wlc->stf->txstreams);
 	for (i = 0; i < wlc->pub->_nbands; i++)
 		memcpy(wlc->bandstate[i]->hw_rateset.mcs,
 		       wlc->default_bss->rateset.mcs, MCSSET_LEN);
@@ -5297,7 +5298,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 	/* try the current band */
 	bandunit = wlc->band->bandunit;
 	memcpy(&new, &rs, sizeof(struct brcms_c_rateset));
-	if (brcms_c_rate_hwrs_filter_sort_validate
+	if (brcmu_rate_hwrs_filter_sort_validate
 	    (&new, &wlc->bandstate[bandunit]->hw_rateset, true,
 	     wlc->stf->txstreams))
 		goto good;
@@ -5306,11 +5307,9 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 	if (brcms_is_mband_unlocked(wlc)) {
 		bandunit = OTHERBANDUNIT(wlc);
 		memcpy(&new, &rs, sizeof(struct brcms_c_rateset));
-		if (brcms_c_rate_hwrs_filter_sort_validate(&new,
-						       &wlc->
-						       bandstate[bandunit]->
-						       hw_rateset, true,
-						       wlc->stf->txstreams))
+		if (brcmu_rate_hwrs_filter_sort_validate(&new,
+							 &wlc->bandstate[bandunit]->hw_rateset,
+							 true, wlc->stf->txstreams))
 			goto good;
 	}
 
@@ -5605,7 +5604,7 @@ u16 brcms_b_rate_shm_offset(struct brcms_hardware *wlc_hw, u8 rate)
 	/* for a given rate, the LS-nibble of the PLCP SIGNAL field is
 	 * the index into the rate table.
 	 */
-	phy_rate = rate_info[rate] & BRCMS_RATE_MASK;
+	phy_rate = brcmu_rate_info[rate] & BRCMS_RATE_MASK;
 	index = phy_rate & 0xf;
 
 	/* Find the SHM pointer to the rate table entry by looking in the
@@ -5979,7 +5978,7 @@ brcms_c_compute_ofdm_plcp(u32 rspec, u32 length, u8 *plcp)
 	 * encode rate per 802.11a-1999 sec 17.3.4.1, with lsb
 	 * transmitted first
 	 */
-	rate_signal = rate_info[rate] & BRCMS_RATE_MASK;
+	rate_signal = brcmu_rate_info[rate] & BRCMS_RATE_MASK;
 	memset(plcp, 0, D11_PHY_HDR_LEN);
 	D11A_PHY_HDR_SRATE((struct ofdm_phy_hdr *) plcp, rate_signal);
 
@@ -6079,7 +6078,7 @@ static u16 brcms_c_phytxctl1_calc(struct brcms_c_info *wlc, u32 rspec)
 		/* bw, stf, coding-type is part of rspec_phytxbyte2 returns */
 		phyctl1 = rspec_phytxbyte2(rspec);
 		/* set the upper byte of phyctl1 */
-		phyctl1 |= (mcs_table[mcs].tx_phy_ctl3 << 8);
+		phyctl1 |= (brcmu_mcs_table[mcs].tx_phy_ctl3 << 8);
 	} else if (is_cck_rate(rspec) && !BRCMS_ISLCNPHY(wlc->band)
 		   && !BRCMS_ISSSLPNPHY(wlc->band)) {
 		/*
@@ -6092,7 +6091,7 @@ static u16 brcms_c_phytxctl1_calc(struct brcms_c_info *wlc, u32 rspec)
 	} else {		/* legacy OFDM/CCK */
 		s16 phycfg;
 		/* get the phyctl byte from rate phycfg table */
-		phycfg = brcms_c_rate_legacy_phyctl(rspec2rate(rspec));
+		phycfg = brcmu_rate_legacy_phyctl(rspec2rate(rspec));
 		if (phycfg == -1) {
 			brcms_err(wlc->hw->d11core, "phytxctl1_calc: wrong "
 				  "legacy OFDM/CCK rate\n");
@@ -6983,7 +6982,7 @@ prep_mac80211_status(struct brcms_c_info *wlc, struct d11rxhdr *rxh,
 
 	plcp = p->data;
 
-	rspec = brcms_c_compute_rspec(rxh, plcp);
+	rspec = brcmu_compute_rspec(rxh, plcp);
 	if (is_mcs_rate(rspec)) {
 		rx_status->rate_idx = rspec & RSPEC_RATE_MASK;
 		rx_status->encoding = RX_ENC_HT;
@@ -7157,8 +7156,8 @@ brcms_c_mod_prb_rsp_rate_table(struct brcms_c_info *wlc, uint frame_len)
 
 	rs_dflt = brcms_c_rateset_get_hwrs(wlc);
 
-	brcms_c_rateset_copy(rs_dflt, &rs);
-	brcms_c_rateset_mcs_upd(&rs, wlc->stf->txstreams);
+	brcmu_rateset_copy(rs_dflt, &rs);
+	brcmu_rateset_mcs_upd(&rs, wlc->stf->txstreams);
 
 	/*
 	 * walk the phy rate table and update MAC core SHM
@@ -7949,10 +7948,10 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 		brcms_default_rateset(wlc, &wlc->band->defrateset);
 
 		/* fill in hw_rateset */
-		brcms_c_rateset_filter(&wlc->band->defrateset,
-				   &wlc->band->hw_rateset, false,
-				   BRCMS_RATES_CCK_OFDM, BRCMS_RATE_MASK,
-				   (bool) (wlc->pub->_n_enab & SUPPORT_11N));
+		brcmu_rateset_filter(&wlc->band->defrateset,
+				     &wlc->band->hw_rateset, false,
+				     BRCMS_RATES_CCK_OFDM, BRCMS_RATE_MASK,
+				     (bool)(wlc->pub->_n_enab & SUPPORT_11N));
 	}
 
 	/*
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
index ac577c8e85..95ccc1177c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
@@ -25,7 +25,7 @@
  * Rate info per rate: It tells whether a rate is ofdm or not and its phy_rate
  * value
  */
-const u8 rate_info[BRCM_MAXRATE + 1] = {
+const u8 brcmu_rate_info[BRCM_MAXRATE + 1] = {
 	/*  0     1     2     3     4     5     6     7     8     9 */
 /*   0 */ 0x00, 0x00, 0x0a, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00,
 /*  10 */ 0x00, 0x37, 0x8b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8f, 0x00,
@@ -41,7 +41,7 @@ const u8 rate_info[BRCM_MAXRATE + 1] = {
 };
 
 /* rates are in units of Kbps */
-const struct brcms_mcs_info mcs_table[MCS_TABLE_SIZE] = {
+const struct brcms_mcs_info brcmu_mcs_table[MCS_TABLE_SIZE] = {
 	/* MCS  0: SS 1, MOD: BPSK,  CR 1/2 */
 	{6500, 13500, CEIL(6500 * 10, 9), CEIL(13500 * 10, 9), 0x00,
 	 BRCM_RATE_6M},
@@ -187,7 +187,7 @@ legacy_phycfg legacy_phycfg_table[LEGACY_PHYCFG_TABLE_SIZE] = {
 
 /* Hardware rates (also encodes default basic rates) */
 
-const struct brcms_c_rateset cck_ofdm_mimo_rates = {
+const struct brcms_c_rateset brcmu_cck_ofdm_mimo_rates = {
 	12,
 	/*  1b,   2b,   5.5b, 6,    9,    11b,  12,   18,   24,   36,   48, */
 	{ 0x82, 0x84, 0x8b, 0x0c, 0x12, 0x96, 0x18, 0x24, 0x30, 0x48, 0x60,
@@ -198,7 +198,7 @@ const struct brcms_c_rateset cck_ofdm_mimo_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
-const struct brcms_c_rateset ofdm_mimo_rates = {
+const struct brcms_c_rateset brcmu_ofdm_mimo_rates = {
 	8,
 	/*  6b,   9,    12b,  18,   24b,  36,   48,   54 Mbps */
 	{ 0x8c, 0x12, 0x98, 0x24, 0xb0, 0x48, 0x60, 0x6c},
@@ -228,7 +228,7 @@ static const struct brcms_c_rateset ofdm_40bw_mimo_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
-const struct brcms_c_rateset cck_ofdm_rates = {
+const struct brcms_c_rateset brcmu_cck_ofdm_rates = {
 	12,
 	/*  1b,   2b, 5.5b, 6,    9,    11b,  12,   18,   24,   36,   48,*/
 	{ 0x82, 0x84, 0x8b, 0x0c, 0x12, 0x96, 0x18, 0x24, 0x30, 0x48, 0x60,
@@ -239,7 +239,7 @@ const struct brcms_c_rateset cck_ofdm_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
-const struct brcms_c_rateset gphy_legacy_rates = {
+const struct brcms_c_rateset brcmu_gphy_legacy_rates = {
 	4,
 	/*  1b,   2b,   5.5b, 11b Mbps */
 	{ 0x82, 0x84, 0x8b, 0x96},
@@ -248,7 +248,7 @@ const struct brcms_c_rateset gphy_legacy_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
-const struct brcms_c_rateset ofdm_rates = {
+const struct brcms_c_rateset brcmu_ofdm_rates = {
 	8,
 	/*  6b,   9,    12b,  18,   24b,  36,   48,   54 Mbps */
 	{ 0x8c, 0x12, 0x98, 0x24, 0xb0, 0x48, 0x60, 0x6c},
@@ -257,7 +257,7 @@ const struct brcms_c_rateset ofdm_rates = {
 	  0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
-const struct brcms_c_rateset cck_rates = {
+const struct brcms_c_rateset brcmu_cck_rates = {
 	4,
 	/*  1b,   2b,   5.5,  11 Mbps */
 	{ 0x82, 0x84, 0x0b, 0x16},
@@ -288,7 +288,7 @@ static inline u8 ofdm_phy2mac_rate(u8 rlpt)
 /* check if rateset is valid.
  * if check_brate is true, rateset without a basic rate is considered NOT valid.
  */
-static bool brcms_c_rateset_valid(struct brcms_c_rateset *rs, bool check_brate)
+static bool brcmu_rateset_valid(struct brcms_c_rateset *rs, bool check_brate)
 {
 	uint idx;
 
@@ -306,7 +306,7 @@ static bool brcms_c_rateset_valid(struct brcms_c_rateset *rs, bool check_brate)
 	return false;
 }
 
-void brcms_c_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams)
+void brcmu_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams)
 {
 	int i;
 	for (i = txstreams; i < MAX_STREAMS_SUPPORTED; i++)
@@ -318,9 +318,9 @@ void brcms_c_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams)
  * bit(s) preserved, and check if resulting rateset is valid.
 */
 bool
-brcms_c_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
-				   const struct brcms_c_rateset *hw_rs,
-				   bool check_brate, u8 txstreams)
+brcmu_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
+				     const struct brcms_c_rateset *hw_rs,
+				     bool check_brate, u8 txstreams)
 {
 	u8 rateset[BRCM_MAXRATE + 1];
 	u8 r;
@@ -333,7 +333,7 @@ brcms_c_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
 	for (i = 0; i < count; i++) {
 		/* mask off "basic rate" bit, BRCMS_RATE_FLAG */
 		r = (int)rs->rates[i] & BRCMS_RATE_MASK;
-		if ((r > BRCM_MAXRATE) || (rate_info[r] == 0))
+		if (r > BRCM_MAXRATE || brcmu_rate_info[r] == 0)
 			continue;
 		rateset[r] = rs->rates[i];	/* preserve basic bit! */
 	}
@@ -352,14 +352,14 @@ brcms_c_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
 	for (i = 0; i < MCSSET_LEN; i++)
 		rs->mcs[i] = (rs->mcs[i] & hw_rs->mcs[i]);
 
-	if (brcms_c_rateset_valid(rs, check_brate))
+	if (brcmu_rateset_valid(rs, check_brate))
 		return true;
 	else
 		return false;
 }
 
 /* calculate the rate of a rx'd frame and return it as a ratespec */
-u32 brcms_c_compute_rspec(struct d11rxhdr *rxh, u8 *plcp)
+u32 brcmu_compute_rspec(struct d11rxhdr *rxh, u8 *plcp)
 {
 	int phy_type;
 	u32 rspec = PHY_TXC1_BW_20MHZ << RSPEC_BW_SHIFT;
@@ -408,8 +408,8 @@ u32 brcms_c_compute_rspec(struct d11rxhdr *rxh, u8 *plcp)
 }
 
 /* copy rateset src to dst as-is (no masking or sorting) */
-void brcms_c_rateset_copy(const struct brcms_c_rateset *src,
-			  struct brcms_c_rateset *dst)
+void brcmu_rateset_copy(const struct brcms_c_rateset *src,
+			struct brcms_c_rateset *dst)
 {
 	memcpy(dst, src, sizeof(struct brcms_c_rateset));
 }
@@ -424,8 +424,8 @@ void brcms_c_rateset_copy(const struct brcms_c_rateset *src,
  * 'xmask' is the copy mask (typically 0x7f or 0xff).
  */
 void
-brcms_c_rateset_filter(struct brcms_c_rateset *src, struct brcms_c_rateset *dst,
-		       bool basic_only, u8 rates, uint xmask, bool mcsallow)
+brcmu_rateset_filter(struct brcms_c_rateset *src, struct brcms_c_rateset *dst,
+		     bool basic_only, u8 rates, uint xmask, bool mcsallow)
 {
 	uint i;
 	uint r;
@@ -450,17 +450,17 @@ brcms_c_rateset_filter(struct brcms_c_rateset *src, struct brcms_c_rateset *dst,
 	if (mcsallow && rates != BRCMS_RATES_CCK)
 		memcpy(&dst->mcs[0], &src->mcs[0], MCSSET_LEN);
 	else
-		brcms_c_rateset_mcs_clear(dst);
+		brcmu_rateset_mcs_clear(dst);
 }
 
 /* select rateset for a given phy_type and bandtype and filter it, sort it
  * and fill rs_tgt with result
  */
 void
-brcms_c_rateset_default(struct brcms_c_rateset *rs_tgt,
-			const struct brcms_c_rateset *rs_hw,
-			uint phy_type, int bandtype, bool cck_only,
-			uint rate_mask, bool mcsallow, u8 bw, u8 txstreams)
+brcmu_rateset_default(struct brcms_c_rateset *rs_tgt,
+		      const struct brcms_c_rateset *rs_hw,
+		      uint phy_type, int bandtype, bool cck_only,
+		      uint rate_mask, bool mcsallow, u8 bw, u8 txstreams)
 {
 	const struct brcms_c_rateset *rs_dflt;
 	struct brcms_c_rateset rs_sel;
@@ -470,37 +470,37 @@ brcms_c_rateset_default(struct brcms_c_rateset *rs_tgt,
 	    (PHYTYPE_IS(phy_type, PHY_TYPE_SSN))) {
 		if (bandtype == BRCM_BAND_5G)
 			rs_dflt = (bw == BRCMS_20_MHZ ?
-				   &ofdm_mimo_rates : &ofdm_40bw_mimo_rates);
+				   &brcmu_ofdm_mimo_rates : &ofdm_40bw_mimo_rates);
 		else
 			rs_dflt = (bw == BRCMS_20_MHZ ?
-				   &cck_ofdm_mimo_rates :
+				   &brcmu_cck_ofdm_mimo_rates :
 				   &cck_ofdm_40bw_mimo_rates);
 	} else if (PHYTYPE_IS(phy_type, PHY_TYPE_LP)) {
 		rs_dflt = (bandtype == BRCM_BAND_5G) ?
-			  &ofdm_rates : &cck_ofdm_rates;
+			  &brcmu_ofdm_rates : &brcmu_cck_ofdm_rates;
 	} else if (PHYTYPE_IS(phy_type, PHY_TYPE_A)) {
-		rs_dflt = &ofdm_rates;
+		rs_dflt = &brcmu_ofdm_rates;
 	} else if (PHYTYPE_IS(phy_type, PHY_TYPE_G)) {
-		rs_dflt = &cck_ofdm_rates;
+		rs_dflt = &brcmu_cck_ofdm_rates;
 	} else {
 		/* should not happen, error condition */
-		rs_dflt = &cck_rates;	/* force cck */
+		rs_dflt = &brcmu_cck_rates;	/* force cck */
 	}
 
 	/* if hw rateset is not supplied, assign selected rateset to it */
 	if (!rs_hw)
 		rs_hw = rs_dflt;
 
-	brcms_c_rateset_copy(rs_dflt, &rs_sel);
-	brcms_c_rateset_mcs_upd(&rs_sel, txstreams);
-	brcms_c_rateset_filter(&rs_sel, rs_tgt, false,
-			   cck_only ? BRCMS_RATES_CCK : BRCMS_RATES_CCK_OFDM,
-			   rate_mask, mcsallow);
-	brcms_c_rate_hwrs_filter_sort_validate(rs_tgt, rs_hw, false,
-					   mcsallow ? txstreams : 1);
+	brcmu_rateset_copy(rs_dflt, &rs_sel);
+	brcmu_rateset_mcs_upd(&rs_sel, txstreams);
+	brcmu_rateset_filter(&rs_sel, rs_tgt, false,
+			     cck_only ? BRCMS_RATES_CCK : BRCMS_RATES_CCK_OFDM,
+			     rate_mask, mcsallow);
+	brcmu_rate_hwrs_filter_sort_validate(rs_tgt, rs_hw, false,
+					     mcsallow ? txstreams : 1);
 }
 
-s16 brcms_c_rate_legacy_phyctl(uint rate)
+s16 brcmu_rate_legacy_phyctl(uint rate)
 {
 	uint i;
 	for (i = 0; i < LEGACY_PHYCFG_TABLE_SIZE; i++)
@@ -510,21 +510,21 @@ s16 brcms_c_rate_legacy_phyctl(uint rate)
 	return -1;
 }
 
-void brcms_c_rateset_mcs_clear(struct brcms_c_rateset *rateset)
+void brcmu_rateset_mcs_clear(struct brcms_c_rateset *rateset)
 {
 	uint i;
 	for (i = 0; i < MCSSET_LEN; i++)
 		rateset->mcs[i] = 0;
 }
 
-void brcms_c_rateset_mcs_build(struct brcms_c_rateset *rateset, u8 txstreams)
+void brcmu_rateset_mcs_build(struct brcms_c_rateset *rateset, u8 txstreams)
 {
-	memcpy(&rateset->mcs[0], &cck_ofdm_mimo_rates.mcs[0], MCSSET_LEN);
-	brcms_c_rateset_mcs_upd(rateset, txstreams);
+	memcpy(&rateset->mcs[0], &brcmu_cck_ofdm_mimo_rates.mcs[0], MCSSET_LEN);
+	brcmu_rateset_mcs_upd(rateset, txstreams);
 }
 
 /* Based on bandwidth passed, allow/disallow MCS 32 in the rateset */
-void brcms_c_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw)
+void brcmu_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw)
 {
 	if (bw == BRCMS_40_MHZ)
 		setbit(rateset->mcs, 32);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
index 7c1d43323a..e20913bdf8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.h
@@ -22,13 +22,13 @@
 #include "pub.h"
 #include "phy_hal.h"
 
-extern const u8 rate_info[];
-extern const struct brcms_c_rateset cck_ofdm_mimo_rates;
-extern const struct brcms_c_rateset ofdm_mimo_rates;
-extern const struct brcms_c_rateset cck_ofdm_rates;
-extern const struct brcms_c_rateset ofdm_rates;
-extern const struct brcms_c_rateset cck_rates;
-extern const struct brcms_c_rateset gphy_legacy_rates;
+extern const u8 brcmu_rate_info[];
+extern const struct brcms_c_rateset brcmu_cck_ofdm_mimo_rates;
+extern const struct brcms_c_rateset brcmu_ofdm_mimo_rates;
+extern const struct brcms_c_rateset brcmu_cck_ofdm_rates;
+extern const struct brcms_c_rateset brcmu_ofdm_rates;
+extern const struct brcms_c_rateset brcmu_cck_rates;
+extern const struct brcms_c_rateset brcmu_gphy_legacy_rates;
 extern const struct brcms_c_rateset rate_limit_1_2;
 
 struct brcms_mcs_info {
@@ -48,7 +48,7 @@ struct brcms_mcs_info {
 
 #define BRCMS_MAXMCS	32	/* max valid mcs index */
 #define MCS_TABLE_SIZE	33	/* Number of mcs entries in the table */
-extern const struct brcms_mcs_info mcs_table[];
+extern const struct brcms_mcs_info brcmu_mcs_table[];
 
 #define MCS_TXS_MASK	0xc0	/* num tx streams - 1 bit mask */
 #define MCS_TXS_SHIFT	6	/* num tx streams - 1 bit shift */
@@ -56,23 +56,23 @@ extern const struct brcms_mcs_info mcs_table[];
 /* returns num tx streams - 1 */
 static inline u8 mcs_2_txstreams(u8 mcs)
 {
-	return (mcs_table[mcs].tx_phy_ctl3 & MCS_TXS_MASK) >> MCS_TXS_SHIFT;
+	return (brcmu_mcs_table[mcs].tx_phy_ctl3 & MCS_TXS_MASK) >> MCS_TXS_SHIFT;
 }
 
 static inline uint mcs_2_rate(u8 mcs, bool is40, bool sgi)
 {
 	if (sgi) {
 		if (is40)
-			return mcs_table[mcs].phy_rate_40_sgi;
-		return mcs_table[mcs].phy_rate_20_sgi;
+			return brcmu_mcs_table[mcs].phy_rate_40_sgi;
+		return brcmu_mcs_table[mcs].phy_rate_20_sgi;
 	}
 	if (is40)
-		return mcs_table[mcs].phy_rate_40;
+		return brcmu_mcs_table[mcs].phy_rate_40;
 
-	return mcs_table[mcs].phy_rate_20;
+	return brcmu_mcs_table[mcs].phy_rate_20;
 }
 
-/* Macro to use the rate_info table */
+/* Macro to use the brcmu_rate_info table */
 #define	BRCMS_RATE_MASK_FULL 0xff /* Rate value mask with basic rate flag */
 
 /*
@@ -176,7 +176,7 @@ static inline bool is_mcs_rate(u32 ratespec)
 static inline bool is_ofdm_rate(u32 ratespec)
 {
 	return !is_mcs_rate(ratespec) &&
-	       (rate_info[ratespec & RSPEC_RATE_MASK] & BRCMS_RATE_FLAG);
+	       (brcmu_rate_info[ratespec & RSPEC_RATE_MASK] & BRCMS_RATE_FLAG);
 }
 
 static inline bool is_cck_rate(u32 ratespec)
@@ -203,37 +203,37 @@ static inline u8 cck_phy2mac_rate(u8 signal)
 	return signal/5;
 }
 
-/* Rates specified in brcms_c_rateset_filter() */
+/* Rates specified in brcmu_rateset_filter() */
 #define BRCMS_RATES_CCK_OFDM	0
 #define BRCMS_RATES_CCK		1
 #define BRCMS_RATES_OFDM		2
 
 /* sanitize, and sort a rateset with the basic bit(s) preserved, validate
  * rateset */
-bool brcms_c_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
-					    const struct brcms_c_rateset *hw_rs,
-					    bool check_brate, u8 txstreams);
+bool brcmu_rate_hwrs_filter_sort_validate(struct brcms_c_rateset *rs,
+					  const struct brcms_c_rateset *hw_rs,
+					  bool check_brate, u8 txstreams);
 /* copy rateset src to dst as-is (no masking or sorting) */
-void brcms_c_rateset_copy(const struct brcms_c_rateset *src,
-			  struct brcms_c_rateset *dst);
+void brcmu_rateset_copy(const struct brcms_c_rateset *src,
+			struct brcms_c_rateset *dst);
 
 /* would be nice to have these documented ... */
-u32 brcms_c_compute_rspec(struct d11rxhdr *rxh, u8 *plcp);
+u32 brcmu_compute_rspec(struct d11rxhdr *rxh, u8 *plcp);
 
-void brcms_c_rateset_filter(struct brcms_c_rateset *src,
-			    struct brcms_c_rateset *dst, bool basic_only,
-			    u8 rates, uint xmask, bool mcsallow);
+void brcmu_rateset_filter(struct brcms_c_rateset *src,
+			  struct brcms_c_rateset *dst, bool basic_only,
+			  u8 rates, uint xmask, bool mcsallow);
 
-void brcms_c_rateset_default(struct brcms_c_rateset *rs_tgt,
-			     const struct brcms_c_rateset *rs_hw, uint phy_type,
-			     int bandtype, bool cck_only, uint rate_mask,
-			     bool mcsallow, u8 bw, u8 txstreams);
+void brcmu_rateset_default(struct brcms_c_rateset *rs_tgt,
+			   const struct brcms_c_rateset *rs_hw, uint phy_type,
+			   int bandtype, bool cck_only, uint rate_mask,
+			   bool mcsallow, u8 bw, u8 txstreams);
 
-s16 brcms_c_rate_legacy_phyctl(uint rate);
+s16 brcmu_rate_legacy_phyctl(uint rate);
 
-void brcms_c_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams);
-void brcms_c_rateset_mcs_clear(struct brcms_c_rateset *rateset);
-void brcms_c_rateset_mcs_build(struct brcms_c_rateset *rateset, u8 txstreams);
-void brcms_c_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw);
+void brcmu_rateset_mcs_upd(struct brcms_c_rateset *rs, u8 txstreams);
+void brcmu_rateset_mcs_clear(struct brcms_c_rateset *rateset);
+void brcmu_rateset_mcs_build(struct brcms_c_rateset *rateset, u8 txstreams);
+void brcmu_rateset_bw_mcs_filter(struct brcms_c_rateset *rateset, u8 bw);
 
 #endif				/* _BRCM_RATE_H_ */
-- 
2.53.0

