Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80020149DE8
	for <brcm80211@lists.linux.dev>; Wed,  3 Apr 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153834; cv=none; b=CynHDOxmUe5lZpbPV7+stpWbq3bt3sYQvLk3V2k/BKliXlensCfR+loeVW3RcnpW9VlZ2+66BworrTJ4y9uzxXCDJmPg6xzPunZus3Xp86L8z1FXBwEfPCQc+dHOe43knGdNN8IB+a2SoBUvwqMQxI0d47ASmIWPN+emIVQg1I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153834; c=relaxed/simple;
	bh=wmPmmXdT8FMwSksDvwRdXeWX/na11P5Z6Ye1jHKblRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwBchYvQfCa5OphELojrGE0xegp1c4kOBp6NFYzFYm7hLIB1Dk5HlKeac0vd0niO5wg0L62mR7v4WaHRZQkTDtTldGbz+SlJNxsuo2xymtrZrBE5Pn2bPln5FjzPaolEUNX3l2p5LqVH7XzcdD933w/Pe5vT7xZYaJHEqbyHx6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qJXp6Y8w; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qJXp6Y8w"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-56c0d1bddc1so7661490a12.3
        for <brcm80211@lists.linux.dev>; Wed, 03 Apr 2024 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153830; x=1712758630; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVQ0U9D/KVAqjXU1brwZZN7jtSQawCJDB5Go47IF4+I=;
        b=qJXp6Y8wkH7QlE6yzIZMajIHhwPnjX4SL4eDqrH6D+XDDDAKsa42hFNi/WRI4W0XGU
         im+cmw+jhaQ1DiPVZ12JqelqJ2nEZA4f2KWlehky2IjhD9i/FdJuNbvZxPpKjYdz5Wie
         cFZ1z2seAXUl9oV5TAX38mSrZFBc+Zp15551SlgXmGyHyBrvx0eX/vLaJXZ6FGoPWISi
         aZsYmPWaNVVhJG7z3a3IK7R5/ITom/JMNlGImgqgXDZOl9KwTYUfR9icTWPUlP1fHeAl
         QrD8b1wWvgU5g8ApbzbFPLzraXrD+ggpxuuJTfHi+SbyXxlyuw7NoAISnp/7a6sWsK0r
         D4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153830; x=1712758630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVQ0U9D/KVAqjXU1brwZZN7jtSQawCJDB5Go47IF4+I=;
        b=rgPn7YGaQbrj2ry9WAoFhWCcKoPi9OF0APIQrzHtmbRX6kKG3ABz1Vkz+3QyveJBOb
         TJA4GVCyD6H7jJfdTWYo93uEy2XkyE5wZKfrmoEWgqOvDH+T/EI+4Pfw8Q8vNxkivukP
         IcwwnmTTueCkj7Fokjv05VGoZWZNRRN3TzimVWf/hMBJeUlXPryVik4KXthdme2xnrxI
         UlV1IrbeI5X222AAZiyEGIgaWKnfYeXz8MlNlICWKPB+X3Zw5A88gUmmtjhm2yN15bVf
         FeSm7HXXHr0Fu+kkyRSLPy4jtKyMNu7Iv+FFGMBn5J7/K9wjPOEqaJ8bhaqI2ZN5/Pu6
         hfow==
X-Forwarded-Encrypted: i=1; AJvYcCWOYCk9T6ExiIaK8tDdB7fP/S/Bv/uzwcekr9WxCuaCBmQOfuNIija01mwkxQXPAOssTC6HPuwH/J+XYc1KNFLQiHGsDIhlX/1U
X-Gm-Message-State: AOJu0YyDgwW5u3weMbabfVwi6kGpwWP8Tcs9ZQvjAlMGX0mZzQeKZ4Rd
	Rmc0ntrQxaefLc42WGiJ8/K2nb8QOR5NP5aEeu3Ep5puDhVN29UEcm7o1qIeUn9OUJZN1eLyQhR
	V
X-Google-Smtp-Source: AGHT+IEq+cedMg/HdXeWUJ46ccGlTECKF+cYAqgFSpQRqCCTL8vGS1xn+Q24HJJd08R2KNhYaMPkLg==
X-Received: by 2002:a17:907:97c9:b0:a4e:5088:a959 with SMTP id js9-20020a17090797c900b00a4e5088a959mr11602611ejc.17.1712153829813;
        Wed, 03 Apr 2024 07:17:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Apr 2024 16:16:51 +0200
Subject: [PATCH v2 2/7] Bluetooth: btmtksdio: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-module-owner-sdio-v2-2-ae46d6b955eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=694;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wmPmmXdT8FMwSksDvwRdXeWX/na11P5Z6Ye1jHKblRU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTaZN41kIdbagqJ8fbnOuBWNq6NcKpm+jnmw
 SokJxjA9ZeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k2gAKCRDBN2bmhouD
 18TqD/4xMdeO7N8l/RfcqlLT8jwGJJpLGtyHMHJVuEX5WDCMPUL0LKwWqGI48sSlBaPNDp5uZ7b
 bpD9xkZtpsFLxeTOAUVR428mbr1ejpNQ8Q/B0ilOg4L002xiikkzLaPKrypNOZVk1Y5sePzi1iu
 VsPrAXo1vFpQ3URnX3Ph9o8esjfPfJqguU835edg0Cf+IgTZFV5ODNGBbDI/tG9YMnwU+4s9FZ5
 FNwTrT7xfi9yInPMbu7qB5/ZVEctiydQWu+0VLjjQ28nokYCbGH/8a67X/gN9G7DkGK0ha6osSB
 G68+oLRWdpykxGXgj9+lggR//ZlHdTJE2ekdyWaVt85iAKmW7n4ixZOPl8LBJrtD1eqQwLAaMni
 ZlxNpG9q+LCoSx7JaB881EeKwS/0zDyX0FWC8n5qYiDpZ28rYjQ5AbPKmaRGGrS0UnqdaY+Hf30
 Tj34ZUSYc+RPw3DS2VGPQ81b/Sz83YgKING3NORDXWg8LBqFaENZ7oMI2zIg0tZnLOTj5hNNNSa
 HmY0qMwWOie2pjXpnyq9yctaaIe0lrpx4MjiUFWnjSKE1JbKfpfGWXMsp7TckdmnNk9zaXcC3at
 +qanW5E0+QlG0Phx+ZW8Brc4TV+mr8Rwe1bYb/o0X01nQ27LdryWzFmxacAc78gKZPIqwQiKU+l
 dXRLBJZzLsoAzjw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the patch in mmc tree.
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

