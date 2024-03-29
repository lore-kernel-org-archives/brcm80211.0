Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2249513791E
	for <brcm80211@lists.linux.dev>; Fri, 29 Mar 2024 17:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711733095; cv=none; b=fbWBhmnKIC4ZOM/S6b7hKZdW3XceL1N1DQ5mtqakr+c4zoxA1IvcdZrSybs/dvKvGXcqlkn9folOkRr/h3XK6KyxQ1C/rL+pHI7D+HFUh7YYadJKZQqSjm97haz/IbHqkAgDihpdzA6LNDFePQo0/5ydwPYHi5mf/klq67yf+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711733095; c=relaxed/simple;
	bh=noXTH8RgGL7KawLoBkrEaQ5WJXIVuj5AlJL341+SDU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpVFWkm+Gh+9Mq5Py0Gq+eMULkesP/0FGfvT/b7XkRth17AbHjhwaXgJ3w/ZyXS4rSxMXI9ukR+t6H3rVLNUPsTimUoio2g70T8tTzZk2djTGEQNJiiD2nNDBqT9ZzbC3+7hPs2OEClZnmk9ZYH4YdoOM8bNaIdmeMQc5tmbqWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UDfLJnQr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UDfLJnQr"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4154471fb59so12283975e9.3
        for <brcm80211@lists.linux.dev>; Fri, 29 Mar 2024 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733092; x=1712337892; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=;
        b=UDfLJnQrTdoq4OYGzif76STQNVBjeYs6UtrGX16V6t0R9ZgtSEgon7FNq1d+5TvIsb
         TnJryGEQSnVI5wv3pm5F38ZMJAiKoGIIdqus3s7hSmITG3IuWBU5od8R3yWP46Lim2iG
         FOOHNcg6hRCZas5A4/+9AHQP5fPEMLvcR7USy5rufBFYYjP500EQoaiPFPcM++mGdjK0
         ihRaQrEhANaFbvIxfJDEQHMhaR3DhqqvPRz5KGmW3X+PSea9ZWCF7TQXnc7er4AVF9PL
         F738t7PRKvuSTh+4kPiloPVFGPPP6Hwr0hUOhcI6YgqlwOMUrgRK5TgzZW98bbuPBWA9
         5Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733092; x=1712337892;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcL5hqCrDYbrBJKg6yubNMlPGipEeaEcniEcZ5X/ejM=;
        b=l1vOukDxg5cGKtvwp+xfsLsCYoX24UZD+gsuC/aqQ2rMJQxFX8KWigI7I2WIQpkwuC
         7TTbAAk/wZYP9LtL/E7DzeFravuAhA3vqRRiSpw/ESGFnDaOH6GHRjjpjRtjfFWE4ynS
         dBncUUlNwSljHi2GCn5wlPLefbDfosmSw3ZlNAstYVScAviv1MnSpJMAoF74TjGn50AJ
         Gkic2Wo4KM02QiQph4JCHNEf0Iepl8K9MJ6MpQnegItUgrUyikUA/0PYG3Q7Sa0y0Ip4
         gz2Mi5uIv9W+gGTfpGABq+dj3NeM3DJDdk9PMrz8RAQY+kOg+s0vP7B16nRufb41A0tq
         uaFg==
X-Forwarded-Encrypted: i=1; AJvYcCW9W9540QsP9s7YO2i5Tf21QXvfgyi/1moff7Lt3V1qLb9CfsqPZqREI9oGhrRzriKDKkt28qMlvMyvUY+qABGkiGUPxzpDS2b9
X-Gm-Message-State: AOJu0YzhBzj0yS32exnQnKVMbd4dtTfEM2+AD4FRT1UciAjpPwMN1MZz
	cMYw6Z0L3EbCfJ9mtfqti4PohMJV0oMHdQGir+cQ9m6AEf0o9OikUdTpRVIFBFc=
X-Google-Smtp-Source: AGHT+IHndS8nu/3l0eb+ocEil75C5QdKWIieUdDFgHlm/5IXoaqNdJplBaNZAa8mBAfYg5ACllbteQ==
X-Received: by 2002:a05:600c:1989:b0:414:93df:bef1 with SMTP id t9-20020a05600c198900b0041493dfbef1mr1962459wmq.39.1711733092656;
        Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:33 +0100
Subject: [PATCH 3/7] bluetooth: btmtksdio: drop driver owner initialization
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-3-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=688;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=noXTH8RgGL7KawLoBkrEaQ5WJXIVuj5AlJL341+SDU8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlZscrGsmgUvjqJCgIZjHOxIlihzoLBO9BSY
 fg3/UkGg5eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WQAKCRDBN2bmhouD
 10WFD/44MFDZMNzymsgjUnQ3eQYk9ZYGtWq0RvUzVCTg3RJAeC5QMaYgGOPTdILnysbGdc5pw1Y
 8btwMyBPcLE0+s0b2snLnak9o3VA/IQeBEo1wDMxi6SUv+Spu3/w+KT9HGF/5z1M1+7MeGKwFEx
 aegcGkBu2NQ9W5RUGN1mN09SJA6PZWzNR2bhc2K5zyA5gCF85RV6wBVAEkfyp2dFdlDxer42il/
 eHnLXd7fslojOU151TEO4etUgSfgbnqT966M0IFu2V5y8n5Gep05sxzB7lUOqGctZlHQWT4DutR
 7G/TUMAyKFz8cq1YdMmylWizy5bxD/cWMndC78oTGKNv9geLyTz8+zN4BigpeWd2CNAF1Z9OQk2
 rcahEfMMs/lR19mqhB/vi87YmOv9DSxXp4MJ8jlft2e6JOcnfCQbEuMKw+N4Kn8GjTipxbHuj9v
 VCZ1adA4/dSIRgnnqChOhoeMMNy/e6c3hf+sYVstG8c5vjTvVISk+yC26FmrnA0yBTj9HcycA4I
 zBhHz0yp3PRxoI1KM7w4XFdpK6Q1fzxFe1PFhEg5zyZ6z8dOBPLKB3q65szRxbVauRRHJmAB5HS
 7YfCAGceDF7Q5RxbQT4890fa7t2cKuJGnnZ/X+hpW4xQXb+B9D04hmee0d+LsdlE9/1XcXZBGDW
 /rAI8sr/cdlqF3g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/bluetooth/btmtksdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index ff4868c83cd8..8ded9ef8089a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1519,7 +1519,6 @@ static struct sdio_driver btmtksdio_driver = {
 	.remove		= btmtksdio_remove,
 	.id_table	= btmtksdio_table,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = BTMTKSDIO_PM_OPS,
 	}
 };

-- 
2.34.1

