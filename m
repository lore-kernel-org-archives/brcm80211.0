Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371179;
	b=QwQf47vDuL6ZxpbpAKlv+ArD5jn5lGgHK8f2TBKvSLp6IKaeU52jzmx9wAww2DWeN0Yw
	 HMFEkHLKxbm1xDIbiFTg6GULK2Yo2RqWRfVRFzrmu1Psk/QnUXPHbv+sUAD5SzQGKrHiT
	 /BAbITTJtwfwyFye1Z9rMclQU6Yxme4yJ+Jv6hDGs/jpuiu4mVYl69d2bsGFm0D3BwPUT
	 NWxt9K+qiNYNezI8/w+U/GmUATrq+X2KOp0m5hoO/DB17LFTeH1DQm1qTjJioGIfvtb33
	 NUKIRAIeOMz5X8eVftxrWTKUfVqFTdUu2qceoK2cYj+DbOHU66NbSbEt8LCuPJ2VBQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
	b=g7j8s0QL26VM7e+hsjDsjRbQCtlfirrqEbi6DjScKK2gWMQsQcHzMUo3ttj8gKr06qg8
	 3yNH32YbPklE391t+h4NgsZTMZFsyshmMIRRtZw5Ov8uKZe1ZoJxyKk4whPonyFsb/yKA
	 E/Sclr/kZ5BODp7JMLmvQQ16nFK95CoCJKpEbAn5cde2hFA28eTIO6CBOlkhtRm7CsGfm
	 RoQcwiyv93y+XBm/CNAULxx3B0Ejd8dH1V1fT0TFC2jTNFvzXVfKK4cvdaeyEYdoB8FL3
	 0F5Qc/ivC5ssF3czMVbd7gWP43p20+VcHTb7r+Q/ONK07ppd3zsVaZB1cVjxpUkV4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZDHyt/I9";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79ED60A3834
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79ED60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDHyt/I9
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1402650a91.2
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371178; x=1794975978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
        b=ZDHyt/I966mWQV3wRFf7KBa8hZWjIANDxbehWq+BycbQWujTuS3JGbWVTiV1LsXiD6
         nlpEIp14TSChgVCFFcM19sRT1S32H6tPEjfhjD1DzOGMHQHwten3o/aA+sieUgxzTyOg
         7Xsu3NycLsxuEatJwDnz+PnLsXaCRFdpCv51jGi7gJoKkFXDoxFXF9vUj0CwdEXUphry
         /5petrhd3B+l8zJ9GFFDv7F+n7WXZiqQhfs35O4jLpU3ZHw0YnMSPSiypa/sDg8Pxf5U
         zbc8byVqpEIdA9XybQErGuMD2c1C9O5j5fmoZUKqH/vY4w+DrWN40EIK+rUna3qc6PDs
         uYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371178; x=1794975978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9+enRz9+49Kj6aoYhV9lhezB7kfDVt/RIXg+q85+po=;
        b=vTg7LClpJbXVGFmgMeqD0S2kSozk1eGrUMH+meZF+d4SodMWNcFTOiCgX+JbjEe07A
         zWEO2aicE87nntuRXm5RQoSKjTuaVHNRmZRntg0Tm77Dw0/Zfom+D7KTax3Rsf0oZJVV
         617j+CxnNUnInpYYx16jxKGQ4+x0PK/7OPssW6gPpTRcX9iQmPx3O65GEidEMjhSARyU
         g2gk6U32sXu3C8q/O0B7Nb8TrSBXr5jzv+7n7HQjGfOV7TXtqmaQv7OHXJQEMnRo5x4X
         45bwYOhEQmgLpaaVw6v76uehgYRL+k7hr2fSIJVR7SzWjNyEJt0SffDirdWizsL75vV4
         Bv+Q==
X-Forwarded-Encrypted: i=1; AL+hErFCywbmHj1tg94BQqZvtY12sgAiMtHebgx9+10+qBked0lL3rj2HQ+2MWpOVDGG6gy6j/kTJ65YBzA=@lists.linux.dev
X-Gm-Message-State: APuU4Z8YcW6ncHmB8z5ujsnKycIuMvJxava4Y0fsdssBtHVPGdZNm/PN
	6stExY7wKmtO9XRNf5gFa4+JQT/uprp8U6w3Y4Ax4heyu8VYK1XcPJm3
X-Gm-Gg: AYBFou0ACy3k7XYFWMsmFxgGkZCCtjYOHU/msPeEbIMnuPOBXfL/Bp+Dy6Q3R86Xjp2
	uYGrJaYovfiGEtrffojv6UL/fFVjM+Ci80xNT0CB/V6G09CfzDZXKQldb4UfKHNBwqq78QzJwE0
	LEj1+toJnibTe2GTY08adfRJCsckU5nj7tBfzXmfyFveGaqIUWbpLHDR3DKCetm2LkKLIvd48Cx
	YjBtpoU3lfHrZrJOXpq73Alt0yNd+qFEMTZJHp9tu+phaC2ScjjEOh+CnKBdCd3tlpP0tZGvuF+
	zD5ot3VSeJmV3/X9KJYoXbbW3EpZDhu7DO7nUbmlloCUNu4wzVsn1+0ehe33RHOjasgiasHCOj6
	XrBaj3bJJk7GClMoZ36qyB+TfVxDUCzyR63J32DTqBT3Jt8sHhjmDxQwBwYy82w7+ibtGFHovPS
	8rSqgD/6ifFOD3RfX5fRMLUUpyoUqGexCCAszGI/HRmhbhNBnnfUKfJI1ta0YpyE5/VZmnr8Iv9
	TDg2B5DeQMTcDlMifrCvvauPY246gCxTHA0IlNvr1645ms7A0xfmhSRgsa12WoslHnIC00p1LV7
	VH7UfpmvUMIt+/M41kJ1Ui43eUR0/2naMZVG6KH1FxXFNZsbgMPMspYxysLR+NQqrdVaoNohfug
	FhFmulBiLZtP6DHDo3YOX81cAkE0oxMHHGLA5TfrpPT9Qhk0YISqYd6osgqz7P50lFzeR0lY1YS
	PGsGCBHrVr6ZrVItJMFO473xE=
X-Received: by 2002:a17:90b:2e83:b0:3b0:9941:8d42 with SMTP id 98e67ed59e1d1-3b182f26e45mr1260122a91.33.1794371177905;
        Tue, 10 Nov 2026 20:26:17 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:17 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:52 -0800
Message-ID: <20261111042554.232998-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111042554.232998-1-rosenp@gmail.com>
References: <20261111042554.232998-1-rosenp@gmail.com>
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

The protection settings (struct brcms_protection) have the same
lifetime as struct brcms_c_info. Embed them directly instead of
allocating them separately, removing one kzalloc()/kfree() pair and
its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
 .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
index a5c1c4d45683..b4c575f8c0f6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
@@ -312,13 +312,13 @@ brcms_c_set_country(struct brcms_cm_info *wlc_cm,
 	struct brcms_c_info *wlc = wlc_cm->wlc;
 
 	if ((wlc->pub->_n_enab & SUPPORT_11N) !=
-	    wlc->protection->nmode_user)
+	    wlc->protection.nmode_user)
 		brcms_c_set_nmode(wlc);
 
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 
-	brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+	brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	return;
 }
@@ -387,7 +387,7 @@ brcms_c_channel_set_chanspec(struct brcms_cm_info *wlc_cm, u16 chanspec,
 	if (ch->flags & IEEE80211_CHAN_NO_OFDM)
 		brcms_c_set_gmode(wlc, GMODE_LEGACY_B, false);
 	else
-		brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+		brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	brcms_b_set_chanspec(wlc->hw, chanspec,
 			      !!(ch->flags & IEEE80211_CHAN_NO_IR),
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 2140feb86964..bd1880e3738f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
@@ -466,12 +465,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->protection = kzalloc_obj(*wlc->protection, GFP_ATOMIC);
-	if (wlc->protection == NULL) {
-		*err = 1016;
-		goto fail;
-	}
-
 	wlc->stf = kzalloc_obj(*wlc->stf, GFP_ATOMIC);
 	if (wlc->stf == NULL) {
 		*err = 1017;
@@ -3878,37 +3871,37 @@ void brcms_c_protection_upd(struct brcms_c_info *wlc, uint idx, int val)
 
 	switch (idx) {
 	case BRCMS_PROT_G_SPEC:
-		wlc->protection->_g = (bool) val;
+		wlc->protection._g = (bool) val;
 		break;
 	case BRCMS_PROT_G_OVR:
-		wlc->protection->g_override = (s8) val;
+		wlc->protection.g_override = (s8) val;
 		break;
 	case BRCMS_PROT_G_USER:
-		wlc->protection->gmode_user = (u8) val;
+		wlc->protection.gmode_user = (u8) val;
 		break;
 	case BRCMS_PROT_OVERLAP:
-		wlc->protection->overlap = (s8) val;
+		wlc->protection.overlap = (s8) val;
 		break;
 	case BRCMS_PROT_N_USER:
-		wlc->protection->nmode_user = (s8) val;
+		wlc->protection.nmode_user = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG:
-		wlc->protection->n_cfg = (s8) val;
+		wlc->protection.n_cfg = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG_OVR:
-		wlc->protection->n_cfg_override = (s8) val;
+		wlc->protection.n_cfg_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_NONGF:
-		wlc->protection->nongf = (bool) val;
+		wlc->protection.nongf = (bool) val;
 		break;
 	case BRCMS_PROT_N_NONGF_OVR:
-		wlc->protection->nongf_override = (s8) val;
+		wlc->protection.nongf_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_PAM_OVR:
-		wlc->protection->n_pam_override = (s8) val;
+		wlc->protection.n_pam_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_OBSS:
-		wlc->protection->n_obss = (bool) val;
+		wlc->protection.n_obss = (bool) val;
 		break;
 
 	default:
@@ -6800,7 +6793,7 @@ brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 	if (use_rspec)
 		/* use frame rate as rts rate */
 		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
+	else if (wlc->band->gmode && wlc->protection._g && !is_cck_rate(rspec))
 		/* Use 11Mbps as the g protection RTS target rate and fallback.
 		 * Use the brcms_basic_rate() lookup to find the best basic rate
 		 * under the target in case 11 Mbps is not Basic.
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 94966418b069..266fe7825042 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -549,7 +549,7 @@ struct brcms_c_info {
 	s8 shortslot_override;
 	bool include_legacy_erp;
 
-	struct brcms_protection *protection;
+	struct brcms_protection protection;
 	s8 PLCPHdr_override;
 
 	struct brcms_stf *stf;
-- 
2.56.0

