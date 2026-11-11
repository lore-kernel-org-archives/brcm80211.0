Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371179;
	b=mqVCM+FRheMJXW+ktsxunhgff5BU6GdAWVj4q+dAD0ECxFrLWuW9izWJs6DRRDN3km/G
	 PR01winNdq0ThYt8ArOUH/irX554KI9vWpo4ukmgT/IqNs91jBcm+p9t5ky02TrE0goY1
	 op22hR1Ngj/wsL4W826BiJ9axzTYXoy/deyLuDkjxu7OuFwpuM/bxhswRDj84fSieD7eR
	 Itm3GzWLRHkcXFl4N00x7RqM+J9dSOfWJ711p3bnoaAIuVZpt+U0ufSBzrvJWltAABcQw
	 g3TYftOCdbrGDBVwx7a1v2hMTK8+OqevvASMDBFBvE+of+BdzKYIbnQ3RNdOM1zQbCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
	b=tAY0PFN28EbZD2caZ2zoHNL8ecDjW3efzmxWJbGsFRwP+Ho7g39niOzacu3VySIUfJle
	 /el/5j22aclWccJWMKkz1cov9rJaG2eL52842W4g5+hMPSYAKVyoLVBomCq7Y9oyRNjn2
	 duTHVWFqo2bZ2F6zaflKugdwPH2m+InbwFO2lhE/dZzcOnmdsyCKtkrRHwqPgneZJYHKB
	 jY7lAoDYW9GTRUIlxG/6saVeltNu3j95i6WubRAropoGFgSqM+pF9madZfwh+7sNCrKgo
	 RzNCrYN/JV5SBbmo/mKzv7eSOQvNphsevucU5uQLadvzoPtmmNF0AADB9dda1iefS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnG5rCYD;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDA0606A33A
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDA0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnG5rCYD
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso1181072a12.1
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371179; x=1794975979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
        b=BnG5rCYDmGrg18E7pEY8eihXmb9cWaQ57J4lgsvOCyCAKChrkX7UED+3+ipnxguh6+
         zGUhfMIJNWPJdmhicrAs1yuIuz4hdZ8dBI8QKnQGH0GTHs+SrEpiygLQIitZvPP5Sb8p
         sLpToOkxr+nCxYXiR2BpFU6H4/cqpZbgthwwxLHN0038SYMvPq8lvyichsiVjV+yACrn
         qHz7vZOs7i79N74NBucg+VzjHg19o09EJTo5gpUKoMYu5R0Wv3yCJe9Z1eB5zxBW2d69
         DIx4+vRPqZKaVHBrz/Rr9/YyB6ydUt2e8z7PcKtXxJY9q2dpK9U1XAF2LRMtdoWdopoR
         S9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371179; x=1794975979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tmzfpg6A1lWSLXkefdS+xUfOhUACBkOM2E4iCYYamNw=;
        b=Warvogfjss1buGa2qWPQxnMt+im7xGN3wnDo31RFhTIqDdKc+CEqdcM+VPSmtU6sad
         iH54BQ9LvoAHvZjcPACTMUUbFiYLKbiLm8rslgotvjMctTQwcq/1kE2hNzQn751pOYH4
         25c8c1sDGZ2ly+8No6TzQ0SXI+Pg7EyJfcvM3cosJJCNBZozc+uaTZMfo7K4aBYQauGx
         p3Xl54ul/W9C/KZOf0EfLb8xBMulM2y/AE7hFk0Y8acaGXEOU2ane0pdpd2Q9Qep3RPt
         punZnfI42wHllBNgfLQOHUvF0REqm7pPox3DVIvAsSAVC8y3B96H9NpNjcK7zJ2UU1ae
         PFWA==
X-Forwarded-Encrypted: i=1; AL+hErHPYctkrTBPTjcJKQsvZ8lPhAIdb+mpsoALhhdEOJmfHa7HEaQ249LTD4g1Zi6pbeLNUb7+6G1TVK4=@lists.linux.dev
X-Gm-Message-State: APuU4Z986aTzbjrgyoCAhn8u2sr6V5CCJCdVyXzTpRFi6ZKTw3qgD1Eb
	qkgSMGF+87EeZAtcHNFvdgYhFkcgF1xn6HlIFT7FdXC1u3RzQZUCQc42
X-Gm-Gg: AYBFou1VQH1XCkA717XBQVoy3jkYdJ4csP3Ktrb/F+oUlb85kDa+Ue1Q9fcj0AuhIgm
	Q48iNXg14EF49MeKFWIQr5mta6NmV7PPDaoWAi5FbFnTLygNb0Gw+CF8NWbu69u5iM/Tm4pMEAN
	JL3E9GEnV5otkxaniqKwM36g1YvbPJHhvXR0W0cNG758DVMi+ECNpmbSOxtWMWGZHCPevUERJEg
	OMDZjk/44WJCJ6pP9cVddtSXpkAEDxn+u3G3Hvn0lRST4tsrAI+MabTzpvVa8fqHAufYonWhauF
	ajhOa7IKEr8+kR8FuPhbfWF/Ex5O7bka9K1T/6enWUS03k/g+DgOp5XSjjss2H4ToasnaYAxiNQ
	Ruk+yw/t59VGC/INiD+erQQbpduCM0CdZvqwsboMh7/uO3PeSpBXI1i8rTK7Ieh4E6E/PYS5TBW
	GD6BxAf+dixUpH6RM9MLP0cpZPOPFIXGoj824qVSwa2EpR80nJWnrqrnFp2sCJnh2Kld0yxBaL2
	oNFEG6/PnR4M/D6/ZPetxLUMI1ugIiykMxz6w9+zB8uMZESo5PrKuatwiqdt8ql7r7Ei3EAg6EQ
	6q0vNIM31Cs9+yrH43shZO0dho+3LjYFff63IPyQodbhb3tgVTw9mGYNmQDhTDh+AefRJU5iqwP
	/olSOntD9bqXv/VN33sTkfWpAcO4HxvKKSmgV/WZF8UwpJ8D9OFayCs43CMk9pfkJBGAz9TOMwH
	ix4w==
X-Received: by 2002:a17:90b:4e8e:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3b182f66064mr1241539a91.16.1794371178951;
        Tue, 10 Nov 2026 20:26:18 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:18 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:53 -0800
Message-ID: <20261111042554.232998-7-rosenp@gmail.com>
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

There is only one struct brcms_core and it has the same lifetime as
struct brcms_c_info. Embed it directly instead of allocating it
separately, removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 +--------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index bd1880e3738f..8c3048082fbb 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -421,7 +421,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->stf);
-	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
 		dev_kfree_skb_any(wlc->beacon);
@@ -471,12 +470,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate = kzalloc_obj(*wlc->corestate, GFP_ATOMIC);
-	if (wlc->corestate == NULL) {
-		*err = 1026;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -7808,7 +7801,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	pub = wlc->pub;
 
 	wlc->band = &wlc->bandstate[0];
-	wlc->core = wlc->corestate;
+	wlc->core = &wlc->corestate;
 	wlc->wl = wl;
 	pub->unit = unit;
 	pub->_piomode = piomode;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 266fe7825042..72720b9f9b35 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -470,7 +470,7 @@ struct brcms_c_info {
 	/* multiband */
 	struct brcms_core *core;
 	struct brcms_band *band;
-	struct brcms_core *corestate;
+	struct brcms_core corestate;
 	struct brcms_band bandstate[MAXBANDS];
 
 	/* packet queue */
-- 
2.56.0

