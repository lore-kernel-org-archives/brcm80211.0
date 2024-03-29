Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A8113BC0D
	for <brcm80211@lists.linux.dev>; Fri, 29 Mar 2024 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711733104; cv=none; b=fu4Z+HICDU/lc+PnPFwO60Vy9uMJk5xTDCBuOsumCksecgpPyUCTCvtdGx5LBT4GeefigKXEB29DYgikzC5HlCr/sNYFXhR9x4WZoi4s1lAnK2PDArhfW0+m1vgXYoMeWLiZ4TCOd0KbUj15Eg4f1zuhxk1Mgt3uiz3wMwu/JvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711733104; c=relaxed/simple;
	bh=dy5/P4BbGd7xVHeclyb88G2cDXZH9d/+8cFl6+jA+cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUn0Kq7UtmRV8XvlnhLx/r/9DSM+2q3gQt/xiYzfN0YjA4LwpwPfwZs9qY2IC4N5RZUJGZ83cuOhqsUH2diVYYgpWLzN2DwsxJW2gEVY5W4JRg9RqjYwlOPer5jiqrM5+tlTq7XL/KYNGud+XjRNBPOHamD8gngmJMWSk8QoJE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RnnHrwMl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RnnHrwMl"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d52e65d4a8so29266611fa.0
        for <brcm80211@lists.linux.dev>; Fri, 29 Mar 2024 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733100; x=1712337900; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcD8HRHcrp/DV6/mbC4noaoosmpuTxjJzgOpstPofQw=;
        b=RnnHrwMlQT4IPirka6HE8IOX4WnP5YmYWGi2OtB6bbSOuS+Nf8oB8SJz/Gr0Kx19pw
         6Uecml+VfmYsEDcVff23YKEcomZfpyAV8LXhJMgxgBDfHmc7QEYF3DFce3xCarTaaGnb
         KjeTZd5Og/wXVW/XFFFQqTLoEw7/IhafmCw7j4Ri8ZJXQucEU8d6MLxFXyReY8ie+37u
         ITondpOQ96h1OE110TaqUF82p7X4nFXVqZY2tpt1oQMc+OkDOhkzoKtO75K9SCVhDycB
         w9X8NrolShhquMOCkKfTb1OReUfvET+Kie+OiNK1Eg4cFEpq8ykNllj0ciINQLZQbEpM
         HIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733100; x=1712337900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcD8HRHcrp/DV6/mbC4noaoosmpuTxjJzgOpstPofQw=;
        b=r4OLirNsc7pG3Bd47ds/+ul16nv3Cxy43uRd7I+85hV9ObNquqf10Fek29FE/L6+Du
         CcewFdl+nDTqlDS+obrb4K+5Ox1nMDqkHVDIJdMnVP2MYQQrIXtC/mkgJB91uIe5OBIT
         h9bh5rkqH2kpeItm0WgMITkIR3BlzKcyIcoeCgb/KHj+ve+nHt0kvIZ7s3AMDhVpBLJ9
         updmWZSNcFWWuziYTXvK5u8GP6dwFyaJerwSUsQQGaFgmfPbBv/MYeNpdeJy7z42UBwi
         Ucms4t1ItfXJduMCZAw84ES1ObdrlCb2BE9cu3yoPR9SYJbdjC8usEBir97KpTgKAE9+
         sUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc6f1uIMuzof4amjlXcq5CBHGihPBeYtB8mbX820VF2fGd7zC+syt8HXjt6KTDnr9RZxHGDbTZ7eftcyFitjhKAcdVfG7rlTAk
X-Gm-Message-State: AOJu0YyqhTf6lN61+TcpUzfTZkOKHYdM8KgVFXAVhNnzs5PjgeYoOwsd
	WiD4DkUY+HyEqLlThAhJ5EgERJ3ncwe6oIKioDNTFLayVohBI/1JnPgg/lrPxs0=
X-Google-Smtp-Source: AGHT+IFyjNez3sE4PWODMtgmz7C3Sd3IPme3UL4MYB3hYvUDweMQ3FjLWXzSNso3+baxRqVn9yAqyA==
X-Received: by 2002:a2e:a40e:0:b0:2d4:ad34:85a7 with SMTP id p14-20020a2ea40e000000b002d4ad3485a7mr1899831ljn.29.1711733099818;
        Fri, 29 Mar 2024 10:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:37 +0100
Subject: [PATCH 7/7] wifi: silabs: wfx: drop driver owner initialization
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-7-e4010b11ccaa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dy5/P4BbGd7xVHeclyb88G2cDXZH9d/+8cFl6+jA+cY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlcZ0oBCo8Oq6N8hTvt2aQpgKAKxHIpjqSlr
 SahyH8uLI6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5XAAKCRDBN2bmhouD
 1/gPD/92fMg4HeDOH6UvazVFxNBFDiNGJ0FuWFqOWnbcog8PrO2WrRE1CwCalUVCWLtRzP/1FSC
 wPYAKDHxoCbDCUBmACS1AywZqPGdRT/aw3iVNVrBDP8MD36K+MzLgAysUxL+5DCQsNF+L+hi7JW
 3gtzJRKDlGqFn/qAnv+C9FI/Ds01g5GuA0re2O1B1Pjl/6AuKk9hLXXOaWOsgDdjhU+z8KaW2Tf
 xhU15j9lvurPC3StuJfkS3YV/4SoVpPzvO8YB54LV6wyx6RHDxi7UItPbp1KbECx/NE2oGo/EQq
 5NRKXKzKAUd+Ldk9rKoRG0Qns2jZdUZd/9UIbgZIBcVTCd6XbVolP0fzkibJ878LM9hxbq8ZX4l
 qILgzeZ0//xpzDjVLIraNWKk7sZ5rHsOUI2TFzneTIuVzfDM9vc9ArlWOPoe1zJSWathXf8DG+O
 WatvfNlBC2gQ9NTQGlOgJQDC7sjHIeIheQAGBrvbfhhCMooPM9G8Ca8p+ivZvs+WRI1mn253DY1
 +qus3gE+ShRmFXkyRfALGgV5dwLm6Me6e2CoBys14WXjhMe9d3hog/3RNZtVjIeAdG5J+Vw5PgT
 StMgaYVmpBBm4LkTKTBuvaFhH89MiGxa7ChhElyueeFEP7QVpO+cVfVEASSGeAOL1vSNOX0M7cE
 osfdo2scTUV3CIg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
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

