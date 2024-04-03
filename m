Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1FD14A4C5
	for <brcm80211@lists.linux.dev>; Wed,  3 Apr 2024 14:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153837; cv=none; b=p2u5/pUTx/VnP7kJRWakbIcc+CAwXtgNOyvTeHOHmy7SgRtVlAPDopQAMUNNCQQ1gmn8eo9XR+aTKwyIbFYaJsTLF8NRlGDyk3MGWIKr7g1qTeAVzio9tJFv1TY9Ho3L9XhPCXy0W+EJBeQYpTOajWUqAwoaIM/zwbhqwqHJN30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153837; c=relaxed/simple;
	bh=QdpKnfzTFfl7629ghdBbT/xMhayZvm2B+bXXRAfXC/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bimJ+YkhgF+yWU9OcOGYYG5W8UmFdhuIgTOWG0gX8x7TKL1H3kOrSXWSIvH1u1wHtFHZLWkayQO2aEP890NpQjVrM8o46T92BmaFGUhFVl89Ufh7pZ6nBriwGYRlD4t2E1ya2TgT//NTiSmjruelOZqDPRq3m9+4Z6rk+paVfTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDKtf9j2; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDKtf9j2"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a517a492055so37177366b.1
        for <brcm80211@lists.linux.dev>; Wed, 03 Apr 2024 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153833; x=1712758633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8CF3YqTJpyZfex95royntlXjuqDXfKm+2I23/q10a8=;
        b=fDKtf9j2sF/b6LG9F5ZVmxfY9gdq179VLIqyKH/8KqZgM4n6Ri6JoUKuZnz2QHXVLs
         TTD2UIIYVwQ9mq7eInyMgBCq1psJfW/mjQnBTsfCvqX/Wk7FYhFo2tiPkXcKhFcAkJ5f
         SVBs9ihZfzZ4s/cR6qcqpnnuSMIOC7HpaSqXTtFGUg9DeTCJCnfKYIRNsiV1cc4A660P
         eE10vvUD+UamS7NaNKbMiYcv9GRwki2ibhGOpYdvbXuln8cQZVbgk7CKcgo4rDyV/j7l
         a/XTbIbK2EEmLXC/BLqL6KHSFP3Wwg5MbMPOQcOQpDuHotQbCKu/Og0mrKhpc7HDjqHR
         f1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153833; x=1712758633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8CF3YqTJpyZfex95royntlXjuqDXfKm+2I23/q10a8=;
        b=fvl3nJzfEjlzBXKtQXV7zqytTCbWQTbHUlvUw1XETO66eS0h1i99x9pd6dXE3hY+dQ
         b13m9n4YYvth+WQl2K6CnylVpfmKJ7N/ijXwoWmRiOFG3AMowkILvGF/6hTagQcd3w7t
         sZzFXrcAxPZXtcajdXwPACHXcWNV3vOt5znSGMWjHayO14kebKgjkyVE3g8n6D1/LJ4J
         fi0FF6RuSGrGAvuJjDeavqnhFBdS9fPT1h+jINpssdL4Wctemu9dXPVTHTxnz/wn7L7V
         Sp71ZEdKkFU4rGex9dvDVeXulgxWKyARxVsKHDhhh9mjWFp84h4FQUr90hzJV8MsFp21
         I7ow==
X-Forwarded-Encrypted: i=1; AJvYcCWEmu43f9BEPvrLBACzAYcfAkEOGFPFBQpLW6QrFQuXQPJS+tLp++we1zO146TLqHJU+mCbdeNuRhKv6EHfbbAszqJffgsrAWn7
X-Gm-Message-State: AOJu0YzyVyoxBMOtnW5k2ZbOKJH7PoRFdWITbUI5Eb10ViSHaZRrggId
	Qf8mZuzI2odDo28UQG4Jv3jXDw/tGFjMD/1o4imx3iZoMotp2kgz+pDnHFzYhbc=
X-Google-Smtp-Source: AGHT+IEUtfdmZfKGWRWu0raSk8TGFpN5pIwAwL9y5tPz9aK/wk4bFhzOX2A0Eo890n5dIjGnOyOkVw==
X-Received: by 2002:a17:907:9483:b0:a4e:a204:e646 with SMTP id dm3-20020a170907948300b00a4ea204e646mr1613986ejc.64.1712153833354;
        Wed, 03 Apr 2024 07:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:53 +0200
Subject: [PATCH v2 4/7] wifi: ath10k: sdio: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-4-ae46d6b955eb@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=794;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QdpKnfzTFfl7629ghdBbT/xMhayZvm2B+bXXRAfXC/g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTcaSwzCg41URpHmCIIgbHloJ5RwRX5cfD8H
 j07G7iVMXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k3AAKCRDBN2bmhouD
 10i9D/99gR/B7ovrPXnyfbAPO/7GCElxPvvHn2XRdqAxM1ZKmgJ+gxlTXYBZvMuLM8KI9dwWCWl
 tSCaUaMHajsac3WbHxh1dsgEvWLQM0XPHZFyXu63SUpfrhIWkFJBqj2yJ5sBOMWoCLvlEY7iFiJ
 XIuwGpvYxcVW3xbdY9u8IRKe2d/QQClR+Pu7YwyaR3OPRRPjrlzxEIazSDl8UCUzoIBEEgXXcui
 D9Nl/I6MXKHrGyeQ75ObjBsC8f/55RhXUb0iwrFKNZ6fG+YHUkxsbjCiBqbDm8+8nvYE+d2WV7W
 /A1XSVK/KOjTZ/94nDBXPK/iIztegRewNOWl1TaG5lMMiIyQqvFHvRi5tqYyHeZiAf1y5FJqEHA
 eYIJqm66pLjbYfM0t8o4wvGIUMigBEVp4b6fZUb8J99Yp9zjodHujpfYihjqQWnhaxtHuHjDr5n
 ZasOnpB46kBTK8c+UVKJuMH/Pf0KQ5Quqv8VhOPdJHnKlfMwKfxGf/kGUBHs1uL6Cisxsytw7fX
 LW+wVCXaVhb38bZ+pjlVneUG11da1AYcl4gJgTHkDAAtTvny3D1hiLUWFQF4b5WqH5f3dIh4RVs
 mi/sXs9DKXNon/qkHvKUJr/49OHoZMqKQQ6S/QgwFY9OTVImKFTmbtSxDaoaGDw63BijvD0NYwr
 +bU9iK84wUPmpug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---

Depends on the patch in mmc tree.
---
 drivers/net/wireless/ath/ath10k/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 1acb9fba9a8e..cddd9e3010ee 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -2667,7 +2667,6 @@ static struct sdio_driver ath10k_sdio_driver = {
 	.probe = ath10k_sdio_probe,
 	.remove = ath10k_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.pm = ATH10K_SDIO_PM_OPS,
 	},
 };

-- 
2.34.1

