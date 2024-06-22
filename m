Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55723629E4
	for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093262; cv=none; b=NHnxIlDwC4KxWwSKYYPQAmsMwgMZQa0GEWVGMzUn7stYuN/AWfYjhlVkpjMIXbVpl8Qa6gx0M45CXoHB8+U4ZF32zK780z/7ZhlQsDh8ed+GP4ZblZ9EU6VP4Wdtdj21AH+TsMx0eCQDVFaTgm3knn/+8NV47BD+DVq6xzmipgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093262; c=relaxed/simple;
	bh=XdLgw78vP983A+TrIdqPxl7VoHeX0riB0ZOsS3TwwGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GeKl5ey2w3ORsO0YiurXuCNQPRmsA97G168aQZMXHOLe0zQtlkKxVZNuBLbvN972XDmM6cn9IZ4JITamYgdtO0kLGkASME+E0TzkEykA0nppVNNoBOYzwkP9IOy3RiZXuW+ktUYdirpbQejl1jhfLU3+hQFjdKivv0wiWEhm4XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwMoyImK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwMoyImK"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so35087871fa.0
        for <brcm80211@lists.linux.dev>; Sat, 22 Jun 2024 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719093259; x=1719698059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=psmXmpnFkPmw8m7RnDe0q4FMekfuWqvHUm1UB3CLbCg=;
        b=JwMoyImKLJhsxW67ajarQsLJjIFNjoT/fE/tchFXUw140L3CXFmHckVWGHviRaggF2
         w9DWbi4aXgjQxzTSoCYyxwJmUDqm3+w/Xo2GRRlUAYOFasAyqH6T3Epo+3NYSALzyqm8
         grNg9/bQWcbOdSp/0ZQTJIoTxlrLz9ZL/Cgknv9r+KbOlWHLsyiNbWXe17daQiXjPbKq
         tbehl7xGgfgEqEKc8TymthHRXSDYyaTHFs6eZHkZ8mLnmWOFxDNh0jR/P2cfzPbTZERC
         cFRtKdBebQ7AVKxBVjsJ3ZUy4xPwuuxdzY8AcBpb1Mfu45Rol5vAx5ViIiEEn/trCZgh
         u6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093259; x=1719698059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=psmXmpnFkPmw8m7RnDe0q4FMekfuWqvHUm1UB3CLbCg=;
        b=qmalgxpTcXynTU7BnVtRnw7zcz1E3oFqA4/jxFj9NOoVhVcpktnrXgE1Z+MwwuVH9s
         Pq+7t7v8nfQwRv38cg5Hsde6OCCDZT/nBcUkut2zsmLJPcwUmHRBhJfPgr+wnreFJTBr
         ZeXl9ydZVkUskN8wvLOoRHwu8rqdqARLI0P0+ZRoj+cc4TrU8JbOnTCYZDPxDuxtN4Io
         xez5vzz1zC73cmmuTrG20c+urvy091E1ipKAltYNl0PwXLd2AYZP6fl4MRIqLYYC9dV8
         fBgWJWkisYA8XyeB1S+SI6LjRVg+f8VO9jv0uiLe9mDZvaiuy5zTUtptnL4RWt+Ew5O+
         lX5w==
X-Forwarded-Encrypted: i=1; AJvYcCUr2v+Ox0SN5vGA7nFueI4iTmvZihMY2cW2vPQiQFExiyN409NOYCQDgq8+rKqz0SJ3dIFg17yVFsIMtEHxBa+VHKYYExObHizV
X-Gm-Message-State: AOJu0Ywck2S0FMLrEjY3+w+sSLhZxQcoa22HqOvfRPVFotov2SnU12t/
	k55Y+16bCKweUt01fQPi11y8IRnhsCdZVeS0jOw60fktxNTXU/s=
X-Google-Smtp-Source: AGHT+IEkOv7yLf6PDm6Vje2xrzSTTbJGzsmhV1y3d5JhLXiHTmWHaXhFLL6OuSN92I/QDJCY3Gz80g==
X-Received: by 2002:a2e:8191:0:b0:2ec:557b:f8a0 with SMTP id 38308e7fff4ca-2ec5b3d4abfmr3710991fa.38.1719093258554;
        Sat, 22 Jun 2024 14:54:18 -0700 (PDT)
Received: from U4.lan ([2a02:810b:f40:4600:108d:ce41:c0b8:26cd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3056301bsm2796288a12.89.2024.06.22.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 14:54:18 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH v2] wifi: brcmfmac: of: Support interrupts-extended
Date: Sat, 22 Jun 2024 23:54:16 +0200
Message-ID: <20240622215416.659208-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The currently existing of_property_present check for interrupts does not
cover all ways interrupts can be defined in a device tree, e.g.
"interrupts-extended".

In order to support all current and future ways that can be done, drop that
check and call of_irq_parse_one to figure out if an interrupt is defined
and irq_create_of_mapping for the actual mapping and let it be handled by
the interrupt subsystem.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
Link to v1:
https://lore.kernel.org/all/20240621225558.280462-1-knaerzche@gmail.com/

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index e406e11481a6..fe4f65756105 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -70,6 +70,7 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 {
 	struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
 	struct device_node *root, *np = dev->of_node;
+	struct of_phandle_args oirq;
 	const char *prop;
 	int irq;
 	int err;
@@ -129,10 +130,10 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 		sdio->drive_strength = val;
 
 	/* make sure there are interrupts defined in the node */
-	if (!of_property_present(np, "interrupts"))
+	if (of_irq_parse_one(np, 0, &oirq))
 		return;
 
-	irq = irq_of_parse_and_map(np, 0);
+	irq = irq_create_of_mapping(&oirq);
 	if (!irq) {
 		brcmf_err("interrupt could not be mapped\n");
 		return;
-- 
2.45.2

