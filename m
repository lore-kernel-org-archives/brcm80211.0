Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557054;
	b=3VRltikwy3wfOwVn+lYKtnl7A4LQnqitElNqs+q94js099ckYoiPyI0tmaJzRAR9VqBq
	 GLI8SfjMZoVBpYiE735VgtHfSREiZ4R8GkvI0RxWSpqZyMvKu058/CdmyJqV2BG9nNrCI
	 l2yo6YQRmLch2eKium4vr2duuPQ39ZGvWE9uQ0Uh4bVw7CUslWnS1mFp2/MvPitTQ3n4k
	 ZhRMlj3SQbXD6aG6kgk5oQb90zXb4PB222YzSW5IErgb7XVOAUuK082oYOTFaOuForMfp
	 3GO4fONEHsemYGgb1CI3V+8kykpDfk/lj7SxuxO12y7wfMo0r5801CZyPg1xh73YLMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
	b=GGXJsuDuv2UGayiAzgosToL8v01aIUBPkplwW/cGCnHJnEjcb1kxgarhWHrDQ6Iu8JSf
	 1r0qEGQQCMusjX2otWBTOM442xrrI8QZYUY6Rsy34kMoMYNX/81wIex9CeXZYFp2sqXHd
	 jd7Z9849dcI5DHPpkAlmlhDJ8oewFACuvIUneILJukj2hYNvjcnCqF2bhRNKFTXhBKmkh
	 RmvSQxG+3DjPPzE7L0AvvwAc+uyivBiGCFm95oMXNHcZC1cV0h+mjW7VdPqD3M0WOcc62
	 Lhd+0Bn5jZjlJVKoR/CC6nC7IrCfQIhGM+xEaBCYzc23B1IxBzH8VixFjgbysyXc/jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGAG+dWi;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C09606A331
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 21:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C09606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGAG+dWi
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso33765945ad.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 13:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557053; x=1796161853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
        b=cGAG+dWiZX2HReqRD5cZ9OvrT3rak87YSSsSM7ILLsOVp1oEbCQ70bcBl2gU0uui/v
         Jy6olcKkbfKqimtMJGUe2BOY6RkwlhuwlQusfRhGs/SNypD0Rny5y88BuAZd+m8M0m0D
         uOv6mMyIv8FTVbsSY2zaFqU7F+TgQeuryRx2FqtYCMN/F8f5bC6i7vQCHymSR1Wod3Rq
         COgNFT6IUKepX6zlve+p+kG5mnwO+1o7b0MrkikT06JT+JGj478L1cS2Lb7d7oplmaHP
         RQCJWCcNaUHCDxgpcVXhkPXukURcWiw0+1nLKFN+nn3w9CKv88zi851r+1Mf896gs1QF
         4iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557053; x=1796161853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
        b=kHXAaKkSB4nXTwaEna/lOh2+Vt8kgr7NBua61rY3gOqOsduFJawEMMIzsADzzKfdGB
         H9FBB+dfZ3mxODIOqga7nBcb5CQBuqxsTiDsXiLyz/q5MbTWdfu0HpGzXbNDlzsf4jTh
         dDrcsw39sdoGbN5bIwbJ76Yr8pIuM1Om+mT6nTQk+PXXWu+ELGKUi+IiJgGywsHtJlzg
         NhG1/aItErpFhgsQfiGGrQTJWD4ZwEcshQnYURpPYJgVGKlGnev8UsSZhUt5ljB4gNvP
         P/epxkKBzkHwUQXsThgCjj1EDE/pZU9KhToLMO2R1j9pCn+3TAPJdL0Jm2MW0pujm7Nr
         ZoKg==
X-Forwarded-Encrypted: i=1; AL+hErHzl3a+JitaqpXs2a7weGQegLsEznnZubPC9pNR0G2Y8Cadh01Zv3nDP26vEVm9mjd+ilLlUhkSC0A=@lists.linux.dev
X-Gm-Message-State: APuU4Z/1UDR3GkXpeHa00LBW1yI8Kt4xyhFE7tYi2cdKmvDMTQFn6NeM
	DRNMnSnoSHo4dASq5LJ7qcOm/W/JwAP62lVTuPcCNTrXuNySjpbZ4Z8M
X-Gm-Gg: AZFdTZdxfYmDLICTOx95ocW80qfvckNktIFN3cyI+8pDCPNMcvUNTpGX/CmQr139Rva
	tpFCxMGWgXB4hqSIxAgJHb2nrwPx0bFg0xQOkRzaryV4krS0XI/JdNfFBdkrhP1t9dYSaXtoxLG
	5oEaMRF2C4Sc4yV7eWnhRJx4EFAB2MxiswVkNIb1hX29akv4R++zdCpHncdI0h1nnu+JC603AJA
	HlK3h2+NL6dSL8ZsMpMjfsnOHr4Cpeo1rTBH5FdvK2Qyp6piB3NpW0wc6ChGNgP+vq7CI286K2C
	Da00S1v2UH5OwyjgADVEhGvjR/HDQqZUi/4yqRSWwFE221OqnbgRTcbzO1ziKsgG5lb4tsaKuM9
	9/FMrH1F+8419OTkY8kNbptluDfqHU2xF0rGi3VdLnvcGGTw1xzF5A7ikvPnopQK+Ft8KVScgzP
	HkDaFFN5gIgbcom2YDd9lRoqoCzLn40vKL/603Et+wOTTVNkzf+EBdUSOke6ho6c1R9fCV01FGk
	vVNzfkxqB3Lf+IkF24djwc9J4HfsiXNosMRsOxBRa4WAzhMWkpJ3XF0n0WNtm7aAuh5+fN/cKd8
	XmGX996r46dzA8dmLSqav9Ymf5bHr4LIY/ziCaEG0M8yRa/+++sbkBzdFsmJK0SzHkf8txg8vmE
	BaCE4UC1wDA9z6BNF0oPkkBoFqBhQPMc8CdgsvezZ6lLYZ4e0m7caB10w/JbtHiWY20ab1YPzy3
	yE7A==
X-Received: by 2002:a17:903:1a43:b0:2e9:5ed2:c39c with SMTP id d9443c01a7336-2f03f1ba01amr108241825ad.22.1795557053457;
        Tue, 24 Nov 2026 13:50:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:38 -0800
Message-ID: <20261124215040.1261999-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124215040.1261999-1-rosenp@gmail.com>
References: <20261124215040.1261999-1-rosenp@gmail.com>
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
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
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
2.56.1

