Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A138B78F30
	for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743327343; cv=none; b=tmz2yKWNB3e+7kBFdw4tZVGX9+8LTLIknDc4hWNEZZ8Wk8vbTSAcaw5biQC22QbKEO7uZ79YOmUng8lmJ+Kb7nS4bKN7mg3NDiISiDksByyM+D9xQBdIGotOH5rmi6ZFJcgv77Y1cgrjYRBCBKsvcxWxqi+ZD8XzNq28slSNU44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743327343; c=relaxed/simple;
	bh=vn4RWc04KCOkhQV8qOk2vm3dDMRh2QxXa9aIxVcgOm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QGGOYWKsrPX7wDIRp0V7Hxu9CtNOHtBMRoRGGzJtYUWPFBtpVkFsWBHUF4sfVTUfacHfI4Jr+467Sd2qeNJuAmtRokIMPeuNn2SuUVkE/Py5qqxanvs6v/sbQCN2i8ky842zkbFX3JYkcFvWmCfY7uf9K0LxFIhPWh7cL60OJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtgSaVCu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtgSaVCu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227b828de00so63186425ad.1
        for <brcm80211@lists.linux.dev>; Sun, 30 Mar 2025 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743327341; x=1743932141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=damfXkqqkFLAicUXgLIJ1TCRf/zr9UzA9ia0GSR3ds0=;
        b=OtgSaVCuaZJRFo4F0frwfZ+CEBIwuLC5Ts4TDLHww48v5ZJHJ5SDPEbO9alp+wtN9S
         UDiavc875NgFouPUu3Io391QmLeRrn6Fm3xs912SG+bIlwgX/mo1T7h8N/VjE9dXCBom
         rnGgacQEP6fquawsldblTU8sLN5mp+vqvwXVxYl24RJ9zIYZvAgkTzp5q7EdudAJgQmv
         +bmyMVyzaUHsbOVT20Z52Q6FgK1D2khnIJRPFirMXgPTZZHsLbAMAdl93TvjlAjbpcAQ
         4OhN68Y6MMMdcK/yQ+9vPPyLW2h0P5r8gldBEknEDgZDKiMOuPAWuzIdUSEk1KJlLKve
         9zsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743327341; x=1743932141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=damfXkqqkFLAicUXgLIJ1TCRf/zr9UzA9ia0GSR3ds0=;
        b=qBsFJN1xPC+jEAtYkMgqVkInBdzgWWi/HB8ArImwcFFuIfQrphsyYWchDsoFYqsXS5
         8VFPJI1MQMYajLXMaaZa9e895eHftO11EgoJsNQLPhqkEO30mFVRqce2nTj9dQTQIf+x
         PZYZb8SrpWsBBT+kE/2mthTLDFLiRta9kcxBWUC3Lnt/HQPUMy2ApXgWGdT3d5bYnFwS
         GqLB0bWi5hIZJIibeiAI+bS/ZsfB2HrcX8PXsXaFmvGdlggBKvtQ/3CuxeX8v2/VmY6Q
         r+MylBdvuQJMCy84neuQy+k9ceYa8mkfhIruF+Kqqt5SmGSs0RMMK7pmye6mxDfcbjrj
         W8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm4bys/DOJburc5usKJ6xmV4sd1mL0CeP0EeNuYiWuVNA7K35xtGNjHWQzMBlixaiDE75aOonGI7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXAyomxzyo5mrMQx0TNR+CJxn3i8epJCuxsO2URqlIsam+svGz
	speidTyP0RGFu2M3eJ83PH1vWvukAh7K3fE3ewUe1qrEK4aoGHka
X-Gm-Gg: ASbGncuguiuN5HMYRVyHYs1G0qjT3M0zH84Subfp0VYCn3RJN6rWhq2b4YwcOgcFGCK
	F5vqe2T4T8HqG6NAyEoWSsTF1AqjB1lIRMjao0eXLprIwXcjWzI6J5wrFxq9ovP9tV4kEjYppCo
	hNEsJt2T6/qiKZucR8fzstJ7yHQ5e95ZFU4GxU8aOBVfCv4Bq0j8CQBCohn6Q39s8/HKx/XX1vi
	987KY1QNGqKYctPWOD9WEnwZkRzchLdspglg9X2GgXcA3WTi0pW62/YRE1PlnOyJiOyFZ3UsnQB
	FG1ivykXFFeD+e3KLtqwN8ihHH8MqXEOqZYbRemo9JVfnHuD25mBsqI2pw4Y
X-Google-Smtp-Source: AGHT+IHhL9J7HVAOvCji2SXZPw9XBxF0oBbuosaUN1df+eNPc5La+nJ642KSd3mgYAb7xdCZcYJavQ==
X-Received: by 2002:a17:902:ea02:b0:224:216e:332f with SMTP id d9443c01a7336-2292f9fc054mr83797765ad.48.1743327340880;
        Sun, 30 Mar 2025 02:35:40 -0700 (PDT)
Received: from localhost.localdomain ([49.37.217.226])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2291f1f7376sm48560055ad.245.2025.03.30.02.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 02:35:40 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: kvalo@kernel.org,
	jeff.johnson@oss.qualcomm.com,
	abdun.nihaal@gmail.com,
	toke@toke.dk,
	jacobe.zang@wesion.com,
	u.kleine-koenig@baylibre.com,
	megi@xff.cz,
	sebastian.reichel@collabora.com,
	saikrishnag@marvell.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Fix memory leak in brcmf_get_module_param
Date: Sun, 30 Mar 2025 15:05:05 +0530
Message-ID: <20250330093505.22370-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for settings is not freed when brcmf_of_probe
fails. Fix that by freeing settings before returning in error path.

Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index cfcf01eb0daa..f26e4679e4ff 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -561,8 +561,10 @@ struct brcmf_mp_device *brcmf_get_module_param(struct device *dev,
 	if (!found) {
 		/* No platform data for this device, try OF and DMI data */
 		brcmf_dmi_probe(settings, chip, chiprev);
-		if (brcmf_of_probe(dev, bus_type, settings) == -EPROBE_DEFER)
+		if (brcmf_of_probe(dev, bus_type, settings) == -EPROBE_DEFER) {
+			kfree(settings);
 			return ERR_PTR(-EPROBE_DEFER);
+		}
 		brcmf_acpi_probe(dev, bus_type, settings);
 	}
 	return settings;
-- 
2.47.2

