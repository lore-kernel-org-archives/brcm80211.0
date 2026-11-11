Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371175;
	b=PNBpLkElxuqB9p2O6zgubR6Lc65h4+vidwR2zxboonIwgTgDIoK/Lxv+4vH6wTSui/HQ
	 +3VgYoESfVnMA+NBz2L5ajEVfEeaLfMejy6vSclicTyVjSAOMqAsYwRXMsXt9DkEtytzA
	 hZ+v/eiTwTHl+YXQ+ZEXo3CfSllghPYjiyLK72OwqtoAbOCdG1TWutTJgAZfUCjln1Ywo
	 ovnp0rl1pZSLrn8HxiyVU3CEyE8GZrrB4umZ8l+R9ahndiKmQfuDteeoOuWf+fP5UnaLZ
	 hnEzgYcm35a8mImKhZJEQ9agEDx8hyiA9h5NbtSzNED39BdHZPk501bgucUxNXTeznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
	b=l35eAHSIbrOWv0m3qjs+YhD687SFxxe/d58ukcXIA9PwZ/NkJ/FcUKI6oJaB+z0la9ds
	 HEYI4pYmxMRArhef7nfwfT6EfAzGjN1MFCnPVXW47xhNx3V10kS1vdqHClblUtViGVWXt
	 bZZ28SjU4fYVffSMUNZ9DLTsvdFCqeeQ0QHwHmwuRVDoGgctzeN5fjjB4RH9qkQ10YzhT
	 v4spWfQnXHtDhF3jUFLDsCDO0/ExfN3Am0MzcQs7wZoo7cBOPMIbqZlbgOgOky1AOvM3R
	 22MYQ7HKSVXaE9G/p+RZXccle6ZyCF5iRQHMROLgtCoE6WVCIE/GjK2gwkD7nT0Mx5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="l/J5iWNc";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AFC60A2617
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 04:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AFC60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/J5iWNc
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1560834a91.0
        for <brcm80211@lists.linux.dev>; Tue, 10 Nov 2026 20:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371174; x=1794975974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
        b=l/J5iWNcL3ru5UflaLDg4cdaFD6tyVNxb3PyI5rZwcYNq5hja+JtcSgW0aa6JTIzaM
         AbyYB9QUoRtOGFFccgHT/YX9QGseWaS8KfLHAWQc3T5AIy/lsi416HOPzTSgd2a80aDD
         j6/39ulRL55VYxjjPhZsn1j9+nCY3uHZ6tqjz4nEs7+qvUbTuF3NJPXN27YEMjwcTARZ
         w0pwmm7JlNOjL1Csz2YrXThCcuDhwKYTROWJDhKYA7bL+t6PtUJNf8jtkqdz81llwwpN
         1psFeW/a+7NHMDqr9uadYUdtY7AJmQH+pdfW2+ZreFg1bOVxKg3ib39I4FSO49GQ6B1G
         Nr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371174; x=1794975974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OJuwCLWDNQnvJ//fIiWxypmNTZUMA1eyYQ9wjOr8tM=;
        b=J99jD/x4PdfT3+9NG0mJUNQ/P3YuA4+8ozvUaFePtNcsEDN1x5SujaYLrCTddNk5EM
         y266g7q1JHdN46ag+9RFb3BedtYgF8CMFvZrRcpbe0/jLebOmCp0n732f6PGIu/3dZlV
         xA3EFfLWqC66Hn4GqlX6Q/BoZY08Gtyt0fmn4nU8DKBduQK6vonnfTNMuP/oiKu7rUuW
         dUsm5lAXtCPxu0Y0Qa3+DPc2dkepW/PeAB+foFAvEVdOoL5q9LE4tU3EIwKcREIJHiPN
         gQsUWgkHA93uyA0MXIWM/DClaUxR0lOwQdeVO2ryd3CfSwzikZX/GMCrZjI0+WN862V9
         n3+w==
X-Forwarded-Encrypted: i=1; AL+hErFuR0sCuazcovkRD/sRgPzcIPJWk6hs1TVgq5YukIn5BON2TlUf/xAUZT2IqFasQw6J+f15RhbSoAA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9FLQxTZJSnaAF5ZsFdXPnaZpYJc8E22SRFq3pce7vs1j3ybF7C
	7MtQvgkdXU7r/gokZF9wzH9LIj4RiOxK+n5O2ngYMjj0GtJcwYAEBOVk
X-Gm-Gg: AYBFou11AnCjzgAxlCqoNo6FZrFW7I/Bld7TZ+xZ96I8Kpqf6rvCN083ejy774ejHFN
	weRcxMnm8N3mIeuW8JtgSqlZCsUKB4MsY8KO/eoDSCJlXAd12/AOvf6SWnANrsD1ee2hLRX1R4Z
	ckISHyhov/RYw0r0Z1CGcWOf2ETV8WqX+URIvtJcnCK1JHJfPvvBEowN3ZGPNnlfbd6bljmze+f
	1JQAcjBWYeLzP261eL0++JBMT/2SdoaoBgr+a39bq8aw0zVRx2Ukz3wXzWFmF66AtI7a/dVXt6N
	oaEwYsI+Jea23FQMhrDH4Mgujk/wE6olTJJOyKEhaBWmJQtTBWAMn3qxDWmoEV/XO3CsSGalhyW
	wBNRR8cRGzoSvS+XRaAdqvkTwlhTQ7ZUrlTEY7pcqYp5NcNZt/ygN2uZeqH7BP6A7I66+NKsB4c
	G74YEoSR68bw53FJGTlxiEU4TKo2bH4tZtgyjj+QQ1x7nNx1cLhyFgTyuUjDuc/LMon2iEyf5b/
	fdOqaREy8v2tCpSlZNKWYZW/fLShs7rXWqzKpAoaDUWaQ/1R0JhwzFhuKrt9ejNmQSsuyb7tpVd
	KpgtjrOAosKhjx5J3rMeZC+gwgWKg+ZKjByltfKlw/E8Dnm4Aklo7HYNC33IkJlODFPvd+S+5Ag
	jjdhT8mml3/pz4n9YOPHeGSXmY1uk0MPRBRa7lCidrdT0hHgzq5x/wcQSzRaN3nhWqyRYB8azvz
	fYJw==
X-Received: by 2002:a17:90b:3c44:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b182efb65bmr1197810a91.21.1794371174078;
        Tue, 10 Nov 2026 20:26:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:13 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 10 Nov 2026 20:25:49 -0800
Message-ID: <20261111042554.232998-3-rosenp@gmail.com>
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

Replace the separately allocated module callback array with a
directly embedded fixed-size array in struct brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
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
2.56.0

