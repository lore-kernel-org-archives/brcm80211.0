Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468318BC14
	for <brcm80211@lists.linux.dev>; Mon,  7 Oct 2024 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728307014; cv=none; b=t4GKH6ZRrYmgGtZ2fTm5oS2rhfnw31gWHG2flRIke6qBN4k12cq4sJ78rzFL1MW2Us9hxJRB+Wac/DyayXv2MncQ39HlkX8c5xkw6Og+Fbuajy0UaZY7Y5nBLDURN3bVRSq8HEFAGc+34JMYN3ZIyOxiSncbOZFKtJTSHgLXnrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728307014; c=relaxed/simple;
	bh=OcYuo83U2iRwCpYhaFW8wDpfY57aiwrGoCMgI1DeJwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OLyrHHDOD30A/Wg9CbPc6GWvXGz9Z2qSw0jYZvQFwr07TmZp63uOlWuHCmLut+4cqxX2Uy9gqxcj5Z5mO3pKBwtYG1ukm6Q9GYmDxSkyfwiKeL1if+IjUnHRENSSCHk5MYXMHmCMforU9VT4vdFl3xdPK+mdL6tNV/UJQDtEn3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Hw/l4Jrn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Hw/l4Jrn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so27438575e9.1
        for <brcm80211@lists.linux.dev>; Mon, 07 Oct 2024 06:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728307010; x=1728911810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xJ2YFkWfoe18Mjx4VFZ0GmwDt9WkCYa7a9JNvVutAI=;
        b=Hw/l4Jrnbvf5jjLEy2vc1+lJz025S28yFmK53hUmuhbckDiNMafJczj2gAwlliFq/L
         NRBvFXmddxjGH0RX3Qb4gTkbHKYY4h+yH4VLd3WXlnSsd+/c6ZGFd2rxTQRFWXAIoZMP
         jmWf9m+gd6kT+4Hq1Tt+UjuOGX/hNjlLDLyBwGFQOGILht6JJRstsET/kuykht6AXy0Q
         qRdKUK5gsN1eL4scfIHBbusert/t3SLiyawSsqtHOx4NANhJ9RFEc1Z0kCiGGQ970ioA
         wdVWNQfCIqMeqEk5BDIXDwGL2fRJyFFhTrY8HB7l7iZ8/LeLhYvNY+TC96mmuUtc8X/U
         saFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728307010; x=1728911810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xJ2YFkWfoe18Mjx4VFZ0GmwDt9WkCYa7a9JNvVutAI=;
        b=M/FZZ+IW7lNDTHoEwABcFyoRQri+UuHhnsaRcsG0e2oVI6ywukvSzAPZ6QqJSBYQSt
         twjcUYOOf7wiP72s2xJ1OpJvC2bsOiHxy8EZbNmj0SDL5cwD1V/GYOdAMX/KRMuArxRS
         rgZBg/zfV5RbyPgC1fOAcERbgVp1jGNyszhhz6mo7dYoLrQTTV26l+E434traJAdwWxi
         trP7rUrjspTllSBCYcHvUNi4KZUXn14Ow2W3gzCmIoZMbGez+s4lhyTOFkke0IEH9RRC
         wsLn1I3XCRjrKDD8dc9DmKnCc1PAKam8imaLDz9y3gxfvPXG8DmRfqtrCwLK5veFaLNS
         MxEg==
X-Forwarded-Encrypted: i=1; AJvYcCWyAnLHNPDaob5L2UZpGWFaYvoUn1kRyXPrMtIGcwaITU3JhFZ9zxU8dp9EaNgQWIkol4FELl7W54w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy49jKoLGv8hPMMoEtaghcmLIGcruM6hWR7d3fFJ9wN63fn2lF7
	i8sBWYXI+QP60zs7YvzzFktWonLqOBQF3IxCPLkCMkKEA31x8d9Igk/qyRAmZ9U=
X-Google-Smtp-Source: AGHT+IFCxIu22KVn102zI/v0p4tBA3WyzTx0G+ILqzEftEQiZFlR0gzu/jBnsdN6zjbqWia8kun3jQ==
X-Received: by 2002:a7b:c5c3:0:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-42f892fd471mr57225385e9.17.1728307009843;
        Mon, 07 Oct 2024 06:16:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b1d672sm92484155e9.28.2024.10.07.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:16:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] wifi: brcmfmac: of: use devm_clk_get_optional_enabled_with_rate()
Date: Mon,  7 Oct 2024 15:16:39 +0200
Message-ID: <20241007131639.98358-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Fold the separate clk_set_rate() call into the clock getter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index b90e23bb9366..ae98e371dbfd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -116,12 +116,11 @@ int brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		of_node_put(root);
 	}
 
-	clk = devm_clk_get_optional_enabled(dev, "lpo");
+	clk = devm_clk_get_optional_enabled_with_rate(dev, "lpo", 32768);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
 	brcmf_dbg(INFO, "%s LPO clock\n", clk ? "enable" : "no");
-	clk_set_rate(clk, 32768);
 
 	if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
 		return 0;
-- 
2.43.0

