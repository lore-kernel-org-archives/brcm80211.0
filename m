Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557048;
	b=oIT3TDAC4EymF9PytIFm9cojfPP18cWmBFlR9bBdppr7b7CxrevSHqAyVRl74/Peqriy
	 qk1Xn6m5LhObZSC02iDJapnMD18/CAfoV6O9ck8ZpUHW+pWPH2bTUdLnpaSTk/oHDPQ2n
	 9gA4xPiekfrhkuiz82nFfFVqoY1+6gDvc9SbhkqAzgvyQsv75bwg8FjebZtMQvijNYWBA
	 JAqaUNmcjcuV5gXCTggK8efLQOmwilgF3IeGy072/irA3QtNePmerXlKGwXkYdPo/TtxG
	 oevlml1X1swpxvwvDwBynm4V7lqjpQE+pvndUq7LPQKbeg7zd7m+OtxB8zwPnzhuwEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
	b=cONTxE2M0LCdRDEpdIG9NRtXDWvWag36wk/KM/PhTXHXERaRCxJL8axAMEOapTof4jzg
	 YyKNAe3f/mGRzteYFl+kRxsFMSPPlQ7gpQWnzaGBPtQ2Iu9WGgqfXbB4Y8nGCKGBGaa/Z
	 TspV5RfaEZqpQ4pumlIG7+IVR3FynbZmp4IH3ymshG4+8rCgXkHPDOKFBSBHz6b7SXCTc
	 /1arxQesZAfNvVgT7cNWpiDADIlYsIVp14wMuJBPD0gpsW8TiSM0uYAdC9Nt+vEKCGje6
	 edsExNk4lQiIAB3sAhe38g85l/PPRo7gNNGVIhCwgCiDkG9HE0Tidrorlw2SSknqtoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmzJyTvr;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82073606A323
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 21:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82073606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmzJyTvr
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f04bea9a93so43781525ad.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557048; x=1796161848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
        b=mmzJyTvrjC1VqEZLf2Lin0hWSfB/nUvO3/lRRZ1cEPWvPtmAEDaCZuPBGoXVCr7hWg
         Bo8d9m3jnskq6BOqx/Qimtkbs6U9MgtbCSNyKw3k/GSdZoFdSd7tLxYveeJJd7EdM1j+
         gMBQ+NWYTYWAUu//C4xb37DjIceKWXsmpzxVDxWh65ndVMqkSXICosqJFEj3DmWOhY76
         gYduLwvNl0+6MGOzsJniMtd8hgA5nZBebrwMO5UzFAYQOq8aeczsEQ0bFUNuQNYOUpSU
         W6i4DBxUjs3EgcVsOPW6Cj9apaaGlxskoGlwsrBnQ/HQzCStWa5zqHy54T0kCBD9wE4p
         5udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557048; x=1796161848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
        b=iKHIdh6WVKCKoqkbO0DA9el2v2CX4E3SW3Not2FRQwQxXYdBuFE27T66/WaAQhBcc4
         K8yU5meEKp3tqEv3SHAEK6Cp46cBTs+et6eq2inFZ7dr7Prz8iJ840czXDShgzxYhZtZ
         0c2xI8DllWbOm6/65ldFKjm7RzYhf2YEr44ykCj22O3jJiN1BhpHIBtnVYsgIGgklGgJ
         p6arhFwno7Iawqz+kAWoC+0Ni1Uo0TjXjyNWvgBPiznPXQP+nxyvGn+ZWsCuAEiCbL8x
         Jm+GCEs8x3OcezgGS4pRHJy/9Ibjm4k9aJv7CK8Q+vY6opi2Bo1oQd7e/eBo2C+DKXNb
         XquA==
X-Forwarded-Encrypted: i=1; AL+hErH/RKglWF0jT8+GMUj4/xICnpJovfgTrODdBE0sDG6I3HYL00PgdYDC9Sru3bKFaI1aymfRh+ukf60=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Qy5/Ey5+xSeRF4JoNwvpGH34Lqkm8gbyebvkV4LyczFE+In5B
	+exdakcHHXpbh+J/ByRdvtM7o+cW/FOe3S+l4D+ZmY9NQ1juFNoSkyeu
X-Gm-Gg: AZFdTZe7XPRaJ/FwwQTnJHO8kYPTmv+KOEuxgzCXjxwjh3JmcheZ2Oij2tTtZuzWKP6
	V/11+w2AYxTai2qMvxzxFvnVuV4AVHBmhFaN0VYcftROBGFYKV1JuDc07V3IKXTWo2w/lU3XNhl
	COLLrSoJQB4PzHed/w0ra7+9iQcwSlz4Q29sH647nESzDFGEQJeRSvm5bgENraImPd27xwqfrid
	5fEfs2I+yXc88022lsFMhA4wAcUnYL2SclsxM35sIbYKKaXOYRA30CH0LEKpL75+wYz53m5oIu+
	+qqNfjGgM4PdlEIZNCbleSSb81Ij/abWipvNhU9fvzq8BtnY6tBQUwzezR8eyoFl2mPRnOn8pYP
	WrpZbkfndVGAiNZigwfOJb0SjEdaescgk32ZB6Pm/US16NW8CuJKLyI9Qc8wMlKQGbE1QrK9+Uf
	c0Zz5D6w6XBbt0ekqQVpYV35C4nI4Sfn8KjiN7dbKhmA/oC1ms3u9DfQjGvj8kPvGxAXdmxZkHg
	9JDSXzIFm/lyE07ZPcmMcFv8lfLPagFQRvxrb0CgF+BFG5NhY0RiiB5CdMkguPhJsL5D9ib5iVf
	1CD9L5Gou7JSoo0nLPOgOT8ArzGl3q513nYIYyco+55AMmUB9cnQRIXt7wltK4oMVckNt2fIMvJ
	hHzSawxVm5ZCrWkJhTcPF1VBAuQ/7eOjZsaD7AYsj/zjDTTH6yrPG26XL4DaMdoplgofh6R42fO
	wrxw==
X-Received: by 2002:a17:902:f652:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2f03f1cee76mr168499075ad.18.1795557047737;
        Tue, 24 Nov 2026 13:50:47 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:47 -0800 (PST)
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
Subject: [PATCH wireless-next v2 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 24 Nov 2026 13:50:35 -0800
Message-ID: <20261124215040.1261999-3-rosenp@gmail.com>
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

Replace the separately allocated module callback array with a
directly embedded fixed-size array in struct brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 3834f2da5aa7..ed022fd2613e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->modulecb);
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
@@ -464,13 +463,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->modulecb =
-		kzalloc_objs(struct modulecb, BRCMS_MAXMODULES, GFP_ATOMIC);
-	if (wlc->modulecb == NULL) {
-		*err = 1009;
-		goto fail;
-	}
-
 	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
 	if (wlc->default_bss == NULL) {
 		*err = 1010;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 425c867964e9..8af883e40876 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -517,7 +517,7 @@ struct brcms_c_info {
 
 	struct brcms_bss_cfg *bsscfg;
 
-	struct modulecb *modulecb;
+	struct modulecb modulecb[BRCMS_MAXMODULES];
 
 	u8 mimoft;
 	s8 cck_40txbw;
-- 
2.56.1

