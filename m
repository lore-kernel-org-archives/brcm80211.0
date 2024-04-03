Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C68714BFB8
	for <brcm80211@lists.linux.dev>; Wed,  3 Apr 2024 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153843; cv=none; b=rwq+2ULtRC4z08tJfs0EKmLMdQhSQEDJPi8OrrMiK/SiW653eV46IsaVWDKejNV5dFobwaq+RIk3xvNlxQh8bTpJzwNAuPeVcz0zsjYI9s+BALX9irKIbgMZQl7kInIM4aJa67cMf31yn2+4vO/9GJ2y1jdV6QpUGLIngEfojgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153843; c=relaxed/simple;
	bh=uGEZExd5go3TxQ++ox1VKkM6W5qVi0yKE/c7ScITjdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HW3Kqp2n8f0pixXSedLdqBSUd/b+P9jWNK/y6vPZIovNgkp5zzCfJK4oIeSw0k+jqlE/9fIHut3s3RbAkyXYa/El0cWIni4GK+vHwujW6mqfqP5atxHOqiayiqJblKq45gY828WTYZNhDSlNsi0VYf+7u7PjZpg6QKUP8dJoNbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2hSojTz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2hSojTz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56c1922096cso8159461a12.0
        for <brcm80211@lists.linux.dev>; Wed, 03 Apr 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153838; x=1712758638; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnRU4IuiiR+L4DbUNFcvoGVCrcztEel/ynJcAah208g=;
        b=I2hSojTzbkObpbpAa99LxDEmVbwkLQgid3qEl1y0RTx04FJusrhxLSHP2cQok7ABpF
         Mf9aPjhleu//XPhCgbT5ugzvaMPHZJ1mB65iePJtulRUepWFZgPkyvBMQwApYzaz4nUE
         fORRoPiW8yg4E1CDGRO63KAoC4VrAkjAOhsdGBfFSYtU3QOp0letCk91KyH91j7ZCAyw
         hXTXPh43Li/nXSb/abZc3k6bu8yhyGa8l6OiGVfHBjKPtH3WofDhRArrQj21F/qbloPW
         PfHjMuxe+pjTLv6wYVZM4kii3+Z52Uuqe6sgkMU/f2G9wpgOsM84GVZuo+q0WK+5tung
         h96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153838; x=1712758638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnRU4IuiiR+L4DbUNFcvoGVCrcztEel/ynJcAah208g=;
        b=XKaDX7ov2f6QcHX9c6DJMCEkd8S5XThJ/WDOjPcFktcpW8iYtlb+8iIyHohbm+lcsE
         dkEYXbMZ7ucyYhJ9TTonRCvDoxTCMm7XzAQzpRac9HZy7nuFNIA//Cq1BBQm810RKX8b
         /Ma3z4yV9z02h3O7O+HQyKwzVbylevzxrQ2WredX09lJaP8mX/Y9zY0J4WlJz9Lanszt
         UUBz6hVN1m5HVKKrYKp1ez0H1iPG3y62wu1hMuT6w2zabr/gsSh2CNpsBrTlDiPwoK7P
         BITBQZqMaYXyMDv88JaBvLivewFjoqZxxwSqoDzt9rQsBKPJBKDZKDGLIqGqvsjzNHsi
         StLg==
X-Forwarded-Encrypted: i=1; AJvYcCW6o3Zixi9kiUh5810mfKPp9NIMWclRNs5OKHb9i9vCgQxjPNcLN5mfLZelAmvqFc1/WUOM8McgDzxTWYa4zD/UC31FL5VcIwAY
X-Gm-Message-State: AOJu0Yy0OSKZtuPB62f0WNXPvmcXccrmJHIliC8jSJQ0Oa7U5Fv78CgA
	hrGaISwXPT/l3KaN//qMt8XwK5tn68N/7/RRZ6Poyz4KU85p7xEpZZisXdswwjE=
X-Google-Smtp-Source: AGHT+IFTX0zGPUE9Ns6+NdhULu8lAEjCjxyg2b/cKN8bqqMv3ElMG+Gylzpf3w9rj3hUtOEzVIzlxQ==
X-Received: by 2002:a17:906:da81:b0:a4e:a114:1afe with SMTP id xh1-20020a170906da8100b00a4ea1141afemr1688370ejb.2.1712153838464;
        Wed, 03 Apr 2024 07:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:56 +0200
Subject: [PATCH v2 7/7] wifi: wfx: drop driver owner initialization
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-7-ae46d6b955eb@linaro.org>
References: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
In-Reply-To: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uGEZExd5go3TxQ++ox1VKkM6W5qVi0yKE/c7ScITjdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTeqS7abKdxjbX/ezfyCtRmlw7qW/HCPv7mT
 6zlnQ7KYKeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k3gAKCRDBN2bmhouD
 13ktD/9YFZuqZloQPg2ULSo6Tu1Ci1ahN/R5OjRUhoWDGVX8+2s91o6KVG79Tj8eEzmgBAY7y6m
 CSnfgaDDoklC/CohY+LXdWsdFugKHpTRCrUo/hHOWOMWn+IZqbt+KAuI4BKWIZVDLkRvUJtAtJP
 scnKqM6sovge8LFoZ+Gcr+OlBPWOH0gr47r9Um12eXr7Api+Hi8Wk5mW875paXmjwXNu/UNGO8g
 WcMCyioIhn11Mmj25rSCrra/W/K7tddspeBv3x02+CWFAVxsmmvtCG1A0Tfz+2mWyYKWtJMicb8
 QI2diPO/Ivim8J/8yfaNkGhY6VrR9VfpfCoiRasYy61aKO7ZQoyAgMMLtvTSdxZ5KrEy5Za7Gy1
 3nnUzpDzvs9IWT/BRvgo5CKHAlEta+bT3rSXez2TQkSpfzyfMxk54h8GOsZdYY4oYqC5wPTyxWn
 4W2xkTLU597C1pauM1MwC1WRcWyXcdb1Ui8WsX7zsQd11xzKm4k1d2NgQh+9xeMaK84oqkZLZ+k
 Z5/HzM3ZS81FPFCjTkG1YbwCbmlZuYBvMSmqA1tSrVXeLOGv9kfTilKwKvYx9rc0hiEjpeZdiiP
 GSaQrf+giEjdwugOrcuItP/4hDJxVB/zOqpAczlXm6+JfSrMUA0J1rvXxNedEN5j2Vg2yhdHFcG
 Iuh94f8K9gmgdxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Kalle Valo <kvalo@kernel.org>
---

Depends on the patch in mmc tree.
---
 drivers/net/wireless/silabs/wfx/bus_sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/silabs/wfx/bus_sdio.c b/drivers/net/wireless/silabs/wfx/bus_sdio.c
index 909d5f346a01..f290eecde773 100644
--- a/drivers/net/wireless/silabs/wfx/bus_sdio.c
+++ b/drivers/net/wireless/silabs/wfx/bus_sdio.c
@@ -267,7 +267,6 @@ struct sdio_driver wfx_sdio_driver = {
 	.probe = wfx_sdio_probe,
 	.remove = wfx_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.of_match_table = wfx_sdio_of_match,
 	}
 };

-- 
2.34.1

