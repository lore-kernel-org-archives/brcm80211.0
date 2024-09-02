Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9461898F3
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317750; cv=none; b=TMnb0gq4S018Juu4eu+JMhBhIqjJyXMIKO2NTyTMCKkuzn8wVIj1Exi8hD6lrjM6zE7BG5jmmMG2wNrqoVNLFatgc4EIJKlq04vYt1l6IZfc2FMNcFHU9b/RttlgQtT5AtR3o8x5QSCQOUjXDnBz8U/t/cX7Psp/mhQ6Du0yyT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317750; c=relaxed/simple;
	bh=uOyPjGt0jQt2rh9a/QIkYjsMGeW+O2UMFkZJfXzINs0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NZcoNIqkUbqQe2JuJz6R0PtY/d/wA8N9NI5Ta/c7tOowOGVtkmXEt3x9tP2IW6UTHTGYOy6Ol6FfdiaFAAZ6OPIfbT9CkhbzeBGOqwkGP1p0063Ujtdk32XgtiFTGB3kQ4HH2qnY9XvRNUqgOhdqxUyxn/rMzJY3PnWtc+3fKOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4kXEz3+; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4kXEz3+"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c25dd38824so683427a12.0
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317747; x=1725922547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNOha94p1Pn6xGxE05olLPJMp0FKiE02MSaHBlDjyGc=;
        b=e4kXEz3+KpBrAEU8jbJOY1aAH0JbK27SbXUrOr3g3tZSHsBBSm9IAJsdznhal1N5Sy
         Hxfp2AMKYnrYEdMDST3N1bYzVMcFGp3+7pzs48JWVIeFbVlHpAHF0VaBhkgcrCAxUsaV
         8urEC3Jes+rOPpEoutpPjxL541uw/hh+4gwkpDNz768ar3l/WL0Dc6S7zr6Mfn31H2ma
         Eqkp0/tzUmoozlc2o+8Aed/7Cb6Hln1GcQNeBS1cLWPvKp63t54tsEo/QmZAMJPof4mS
         +8Us0B25NAm8iyKXGzlO8f/vpxpiIboZxZqjL9/rwKYH8nIo+zAw2gKeTqBhmn6m/Xyp
         d8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317747; x=1725922547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNOha94p1Pn6xGxE05olLPJMp0FKiE02MSaHBlDjyGc=;
        b=lEJHGXdg1LJb0WWR7NwaOojb+ZuSBZWZQ8pBHtudxNXyrnQ6KTR8Dx0+vV9f0VBanX
         0BoBn48SnOMkkqeN+kSPXME3kEa7FWT8rgec/krGTXvSHl7597UQhdaB+sLSNmP/ZA7m
         UofbVCFXfgbULoJK860B6QyMvHQyuH0xljeJt+MzfLGtEIUyxWJsKrHUBToSpDf1UrJN
         K050TObu6ebT3JMnGAQACZ6ZFUPhCYPfCsmS00JNf1Yzt/YswdWGRoCwrdJNlpwBnDFN
         mOeghqcC3fbT6FgVFrVzMR2Ysp+I2A9PbSS4d1uYmBZAYoFKnX6Yj66EFvsp8vhduv2Q
         qfeA==
X-Forwarded-Encrypted: i=1; AJvYcCVFfoT1sraCFclNoxHCQbt2WyirkcBNfzI4zg0/Wcrr9afjzFrjjQWYyPu8qH0/iJeEcUR0bjnGpBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMnTaw00novXxz201TEF7SUyxVeUNry/u/R9/uJj8LoJwgWyOd
	Qt3/x5S7vjD6k36yubGlAXo8Ixiw5Vd4KAgKgv1tdn+2khteeo/G
X-Google-Smtp-Source: AGHT+IGqqJa6E9Fi04lpv5ylXuWwG4McM9U+cVel0dkTj5wzsYa/5sxRsZvHI2+j+UqV622HmJH7xQ==
X-Received: by 2002:a05:6402:270b:b0:5c2:5f31:8888 with SMTP id 4fb4d7f45d1cf-5c25f318b71mr2775796a12.15.1725317746338;
        Mon, 02 Sep 2024 15:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:45 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: linux@armlinux.org.uk,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	linus.walleij@linaro.org,
	alsi@bang-olufsen.dk,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nico@fluxnic.net,
	arend.vanspriel@broadcom.com,
	kvalo@kernel.org,
	robh@kernel.org,
	saravanak@google.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	devicetree@vger.kernel.org,
	vassilisamir@gmail.com
Subject: [PATCH v1 5/7] wifi: brcmfmac: of: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:32 +0200
Message-Id: <20240902225534.130383-6-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240902225534.130383-1-vassilisamir@gmail.com>
References: <20240902225534.130383-1-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert irqd_get_trigger_type(irq_get_irq_data(irq)) cases to the more
simple irq_get_trigger_type().

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index fe4f65756105..e2611f164fa8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -138,7 +138,7 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		brcmf_err("interrupt could not be mapped\n");
 		return;
 	}
-	irqf = irqd_get_trigger_type(irq_get_irq_data(irq));
+	irqf = irq_get_trigger_type(irq);
 
 	sdio->oob_irq_supported = true;
 	sdio->oob_irq_nr = irq;
-- 
2.25.1

