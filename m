Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557051;
	b=GPsNKqMuD+zRkdf2k7JFsQoTLZloh8Ks0V+HaDCxonfPFRUhHooClfHTgP3PrX5SDgk9
	 DjeYIh3bqbhypQfMYBtCZgceVkvYjug7A+XGAhU+4vlsokLIlgOX5hqnbLVmK1cGTVweh
	 gpaghYHPV9LqzaabFB2rB2gH2EpFJbiqsKW2ufOODv+0Vn3gAwoi1Hw33sDOOqtQnLYUW
	 5fu+d1uqZfao7JPoh42T1IWz2APuXp67Z3zHO9ZJIXSc/POwUIKz2pp/lK5TNegqHZzfo
	 bx4l2W0Wy6aB6Q4rqCOF+Q0/QP0COxZC18NSjSJa50jVW8N4Wu469tRjA+ktV3VXBCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
	b=rHIdk7xAU1wYMMk+qGZ182SqTBmnY84X9aWBh8uQ4MxmTQh80dXtbkPoSgwBN3CF3pmK
	 RrUsFymF8rKTs7CrZwfiOJC78xyQ8Z5j0Rhkvzzg7tTPPzPpcTac/8MbSL1QP+1tKjYI1
	 9OyfBTkXSnIybsayP+0DdHL2LFxE9rybjSBqS3Y47aMUxpLWIbiVyavOz3Ni++hS4wtah
	 H+lwVP0ncP3TzM8gjfa6Ke344jo+cNos+buUUai00jPc82ZJJf2RLupo+z/tJdg38CcLQ
	 VR5M5U7WNcZxPMb+07lytAz7p2wQ0aafBI1F9E8zgfCeYqdKAsI5EYjIabMRBbvzSSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVyvLeur;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5DE606A323
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 21:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE5DE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVyvLeur
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f0414c1062so29665975ad.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557050; x=1796161850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
        b=FVyvLeur73uosAWgqsZxQ7WvhfJIncVAk5DZTNg232rZR+i6smGRF9uJZuuvQMN6Cq
         0qhU4ks6GdowYBJ44f0e3smI+FmzmX3HDQn5U2tNB4xHPZm5oUR6xhMTJP9lXERwe5u6
         PGKh8pptku4TLAD/U3hnHy3RaNcXQZtq50AMXn8xOe9MeFSASY+/3+6JqO45pVs6/X1s
         XF+XIl5rariMw5ISV9ifH1SYgX/IvrAZec+PHNRXvSeXGp2DCtr6GPG9sCV8GaOp5TwH
         D/RoJE+oAN94joOUbmnpfanypmnFTn/S4NUcYV2y4oUiPkmBM+xVWvBSRohEbhhWJMLt
         qbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557050; x=1796161850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
        b=TSPIpiWcWBk+Mo91/m4NU5avip8XD0cKDB/Ek8Zg+8Rg+NieZqdNuPByzTy3i1TiTX
         xLdAk/bdbFqfsiHQd4AUavsT/EAzCa6EPdMd8UM88fMQLwhQj9Hf9Hf/TdnPjWMKxh+j
         J9TIycy2sh7tIOmRsFTXgCOA8yowcEYoDJ6AmnXI7gu11CaU+bXWlNho3lSGYcd4lsg7
         KluBHk20qwDDDt+SbXZDEGcILzRI2YFxKka1IRcG6dWqs0U/sg14IlzzjNlnumtRkrfv
         Pr05bHOtt2vl70ZaRInTHPbzxWrFtQ1RLQxGVpVJsEpuTtGQO6v1K38A/Et+aAukINUt
         oD/A==
X-Forwarded-Encrypted: i=1; AL+hErFeOFK63weWq8zbc6gXlnFIYcwgP9rLpvb3l2ddEPbcISuiTLQnABE6l/VuRZQEm/78YZ7CFSljt1Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z/3IreYcMTLUWxZYtoJy7wmlNt6z3sc+k0gtXhONBg7nN0N+tC3
	Kk39hj4SbXXxliO37ZLCm7bHEpT4kIlieVPiqYK8zxSOmCgUmoEaG7Bb
X-Gm-Gg: AZFdTZerZDZX5cXCWTRfZStHuM1p04CN0biJBvIqXDfp/WDjHmTCgy/tGeeNMfxtSU3
	D1/KLh9MKq6VYNIihzNbSTrU9okmubsm2/vrPRxs2pOkmR99eP4zoDK60tJkpq5eVGW8xxLzDFn
	usDo028fAzBHW1V83AhCVSNNmGspGPi1XtPHC9/Buc3JOQxvQAuSPh3ZwrHUjWLQOw/SInCjAXE
	sjxZgrrolAavDvLfGZk/ZHPt2noFRokBvJS0VvN2x1Da511Dck67h04G+J2ZiysxLWm0uYC10z9
	fAsgx+ybuHsnTaZeGFL2EvDZhizwLSJa7rK5WeEqqtttJyIWrh/2kMMIOposP8YIFfzI6cSSdks
	p+xfNiBljeSztx68H3IFtL1ymk8hlndIUVo+MVC2+aXFIGrm0KDHihq95NG1f8v1sFRlz3As94q
	eloM50a1wN2y3urdRBg2kZKKJQrRxXTU707NHUnXMy9nJlFCkxBQUqENL8hhGokEoJi39kFYEJB
	fEFdKFei+53hjDiIknUNyw28hEXQXWFbjWycydZD4DjThtvV0DNr0yi6PUC+Ti7BaDoQYA2iUsB
	rbWxLQ7a/fzLnagDuKons+FGNJAmuxx3L4/aWsblyf+bILFVcZLChugzAzBdk0SLFfwSGiVLeri
	G+zBo6qKdhnJJRlF6N8oPQi7C6lje+T71t3/ou/2MEqRj0X5Lz5P4PQnC1lkWTatTufwz8kAShG
	icoQ3XJmSn7JBpaax8ssUzI4Y=
X-Received: by 2002:a17:902:e847:b0:2ed:a66:cc7c with SMTP id d9443c01a7336-2f03f169619mr149288505ad.40.1795557049990;
        Tue, 24 Nov 2026 13:50:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:49 -0800 (PST)
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
Subject: [PATCH wireless-next v2 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 24 Nov 2026 13:50:36 -0800
Message-ID: <20261124215040.1261999-4-rosenp@gmail.com>
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

The MAC statistics snapshot is a fixed-size struct with the same
lifetime as struct brcms_core. Embed it directly instead of allocating
it separately, removing one kzalloc()/kfree() pair and its OOM error
path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index a1888ff02d08..711e994dd04d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = *(drvr->wlc->core->macstat_snapshot);
+	stats = drvr->wlc->core->macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index ed022fd2613e..d000e2a70870 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -423,8 +423,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
-	if (wlc->corestate)
-		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
@@ -493,13 +491,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate->macstat_snapshot = kzalloc_obj(*wlc->corestate->macstat_snapshot,
-						       GFP_ATOMIC);
-	if (wlc->corestate->macstat_snapshot == NULL) {
-		*err = 1027;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2997,7 +2988,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = wlc->core->macstat_snapshot;
+	macstats = &wlc->core->macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3054,7 +3045,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 8af883e40876..0e6a5edc74c8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -240,7 +240,7 @@ struct brcms_core {
 	/* fifo */
 	uint *txavail[NFIFO];	/* # tx descriptors available */
 
-	struct macstat *macstat_snapshot;	/* mac hw prev read values */
+	struct macstat macstat_snapshot;	/* mac hw prev read values */
 };
 
 /*
-- 
2.56.1

