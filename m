Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F85413B5B6
	for <brcm80211@lists.linux.dev>; Fri, 29 Mar 2024 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711733101; cv=none; b=SIKyz+r9semo+5WY/6ZpnieZV3lUs1bSLVrt/LTRmAEfIWxZwCXE8Xkw+wDSFbSt72ADWXfshTq5nIGQ+hRhO6UyCGACtc1b7zxoTOBqlLZ7N2U/yTrq0zYvUKNVFTlXuhbLzY/ODv2Tw+uQM4AKwfLKAdf2+7+JwhwD5HLB6Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711733101; c=relaxed/simple;
	bh=nydkRqQqfWxB+bwGXT+pWOUlUp96ndfzIb+plXc0Luk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7STg6vF2UL5tStEA3kunsA+ZuMndPxHVXvZvEj88zKca82bzlbpwrrvZ7XHxMAmD9IRoKcQDjBe6zOwTFcijX5GtREvMyAqdq7ZJf/umq05B5N98bQ5B1GMjz6n7CtASm+knWtY7XEDRfvQVlDuqnyx0d/tPmmJBGuQfNMeMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IQ/xi+rW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQ/xi+rW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41551526477so3671955e9.0
        for <brcm80211@lists.linux.dev>; Fri, 29 Mar 2024 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733098; x=1712337898; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Roqxke+jisLthE7YZS3ozhXKeGeqrvDxoYL7VwBZiOM=;
        b=IQ/xi+rWPWx9v8rjoGqOHgkMDnct3eOwViGwNgZoss1ymXjA5rHNLB1pkskUbkljAq
         cOZkptuSIk6Y5FP4r8tVjahISyPf6RTJImKAU6V94M9pCdaT9Sa0dod+xc9IkVzDSNbD
         mIdWxDTRtfim+P7Y1KDOSi1rBnnk4Jrt3fqedOEBiriyHtymuCjE4yNd36AknK0AaQpm
         jqtXEt7My8+b1YD2gilBpRkDtkK6KjDvV327ow2su/XkwRMvVm2nY/0rmtxM9P2OzKTl
         n4hhS9caGzmzkHgpCGiXzMDzhPSv9TVpaaDvO54ckmjHYMQdCDq6mcFi66/gdgTy0jUE
         NC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733098; x=1712337898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Roqxke+jisLthE7YZS3ozhXKeGeqrvDxoYL7VwBZiOM=;
        b=ZvGIQJkuRUHOIlsK4LOBbx7Y1EA3PhaT9fqkhij4sKDGGTR+BdSZfxhGCpfAXWBjZh
         GQzhA4T8+SOdRf0UKkUmziaKO5uqVZJYtt91P01ZpdRxqxsYxjUJA5nLhKnkCVBMLfNu
         j1C09fnSd/U8KrRnKuBqYM0k2vAsUL61JrkBbcc4VCkHbNooeuHT2MlUGaFfJC0gwAtZ
         3E8kGgf2t/2Gg3EEM30ndKnf78D00OxS0kTj3aH+Ic02LTZc96klZgQoz8bagVI7lt5P
         KpX71dCSYfuMN/X9saM4WkqQwCoEVaOv6X/ifcdqa+efWX0yfJNv7aum3cE0Nk8GhFLv
         ItfA==
X-Forwarded-Encrypted: i=1; AJvYcCXvGTivJORnxtkyK0YKisrSWofiBkng2I2sMkofRrbhiLNRXwmG6TSwHzGvpctJ43+tHmcJ9r+66N5s+ntOkPDU1LnQ3+zap7av
X-Gm-Message-State: AOJu0Yy9FMhXEEKrQk1+T6P7ZG1Q8ByY3m7WBY9c1zeeTJJWo+eKORdT
	OCBQPFCVoM6TcvVKLCd9SmKwOZR5DVCCi+TIPlnS2M/UKnqIz+PolBqaZHcIGKY=
X-Google-Smtp-Source: AGHT+IHX1RYKXweNoW/4aWXP4wll4zlnxIIegaGH0ndDYfOaiowD/kZKctfWDkTRS7cSWKil7XXIoQ==
X-Received: by 2002:a05:600c:3556:b0:415:45ea:9922 with SMTP id i22-20020a05600c355600b0041545ea9922mr1810546wmq.35.1711733097986;
        Fri, 29 Mar 2024 10:24:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:36 +0100
Subject: [PATCH 6/7] wifi: marvell: mwifiex: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-6-e4010b11ccaa@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=792;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nydkRqQqfWxB+bwGXT+pWOUlUp96ndfzIb+plXc0Luk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlbB3ikwQPsoocZuYMqkRrpjcu9xVmLzCYer
 i6ERPR5OLmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WwAKCRDBN2bmhouD
 1xrED/9h7qikJ7wiFUT5mJeAPPb56pHQIR3znbanFDO8iSSWRpJqkniw3tF0vuvMayv8QUnMn8k
 gbqHlF+enH3aqH0STc32gU582CkuZAI3UE2s3B5cQOYtxyDqYLA2F8bllNV3XEAABvOErLxU02x
 CJdEx6q0e+XPHvbxjfDX7r3Umv50WsrfGjtvLJVVRYCqRHMXei+5w2VrOILx89PegmnLbMZ6vn1
 oBTzHypnSTmhweyK2O/o+7mfO5WZ2azj6PNiBVPCXh+Fu1ENwjnJCUE8pfB2k7e8mxPK3FXQ6Ph
 njBzMk5BNW+RPXqN+yMOy+cC2wievLZtxKFVAca32Psvq5KbdZb48tOkYI5grOkigkFYjHzX0yK
 3OpZj4z/mB5A/Ioe3NYSq0tuvuEyYT+2IAC8DuBZ49JpcYqHkQEF3EwbLqOCKz/whyziiIYSZ+B
 tSIWpe4XmJVH6/NhmPLfR9ggYy7Z8SyZQp3gD1KHpkVRqVUIoIyMZQGYzYuRVxmnECSpi2zLda8
 g7pggI5y4t4k8puQZld/fxmKSYrfoAeIhgFnDjmHucgYUEbd70PChlJaGfKXIUBQhsbjoU38vLh
 72VvpFmDV0wLK5iUYnAT6fSG8bB88zS2LroeJ3y1rfCTA/1VMPT9fVOnZCCwLWyQ+kJ3JMCUHVK
 /ald/SQ8O0m98sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/wireless/marvell/mwifiex/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index e1b58ca1b3ba..588140453821 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -979,7 +979,6 @@ static struct sdio_driver mwifiex_sdio = {
 	.probe = mwifiex_sdio_probe,
 	.remove = mwifiex_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.coredump = mwifiex_sdio_coredump,
 		.pm = &mwifiex_sdio_pm_ops,
 	}

-- 
2.34.1

