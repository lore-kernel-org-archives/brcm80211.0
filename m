Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C11188CCA
	for <brcm80211@lists.linux.dev>; Mon,  2 Sep 2024 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317748; cv=none; b=u7HnJXebxBds7NtglWlTZV+Jrk8nweK/65EEajO3lJQlhuQ6CYFgay3cW8xb4XEchw0lMKzaUYf3KMnWIjByo8fKFxKUxsO91FzLGBMbQpLITJEcAhkkt3LXtwTmRDN8W2lEmJiIyBmY8o3P0KBr1rY0ckQsal68Ns86cLC6yeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317748; c=relaxed/simple;
	bh=PdsMdAs4i+1KnGUSIyj6Cvkto8ku+RF2Yz6vhnepAIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fi9lYv2m91H/XbyZ1ThkT0YPXYCjAkGO2KA1FDHKyMN2KhR1hFJSWDU6NLVq49mgihIqKB7+G+mYO259uMCcY0KCWZTA9GFoOgl0bJTSNWuUxOlAW8d+WQ0b2uuI77CEjdxsKcXdFH9N/QZnOQ7ZzGsFgvT7O6o+tyjr5liXDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b93kuu0d; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b93kuu0d"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c24c92f699so2359513a12.2
        for <brcm80211@lists.linux.dev>; Mon, 02 Sep 2024 15:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317745; x=1725922545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ3BMP71Ks39+pq7NwGF6/mq64FhkUT40nnjV/3W63M=;
        b=b93kuu0dSbs4vNnJzhmGeZJaw3+IRU75ks7/xEklhGFRPX598CXltgyDteS7XuAXat
         Yq7v47rmeEWVlvHIpnS+Y7JgeezruKUTYx5fBr31VCRrNnuSlqSZ+8OrliU9K8GRP6V0
         o3H6w6buuGSDZvTK4GgL9wsfJ4Pfmpv8apE7QMAeiBv0gsvSmGma8ieQDKi+GO+87s+t
         CODLuwWK48bkjFCOJa7695hhf9mwADDx58tJDccLi+Igm3drFLqNXFO23HZqezXLCOnI
         M5//f4xXqBidpN3ttiJdcoJYVsJglrVGPX2P+VyiYkPwLToBcIo8sj7i7szEdej9SNvP
         K01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317745; x=1725922545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQ3BMP71Ks39+pq7NwGF6/mq64FhkUT40nnjV/3W63M=;
        b=ZOP4QcMdgHZKOYCeuw+h3Ypmc7f2jDxhadfUf5CmGBXNRs6JlyovmerzNtcPTP31cD
         vrGKghh7rhZ46XF2LH2piGblNTyzePzkVkG1tH2ip3n/p0umbOZi6SH/ChVFZ7Er80vp
         y9TBj+MWq1fpUP6dAtnM3rrrZlV55QVr083QCSA3fX3NSn1qtSijCYi9dXmiYkwZdXzY
         ka8IpUI31QPjZ9qtEOCr5Aay3X6fexoEJ+KCmTk+ag9kfis/o/xkhgq3aHHPYRUVuqgW
         87q2Qm6m40eqXdtdzOHTZSUvZjpWUNY8mKNgfRQf0o9Xo8dSRisKPoKCJN+kElEWIzfh
         EtkA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+oWE5P9A6sy2MvQjEKuwrfJbuVTy9KkrvW3tGd/EwmXNp/1EotHWix9ofAY8s6axB41SMRoybO8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRHp7kr63VNtyW+VydR68INtLoOITFEBAGy0wXH8QK/ZsxZ5/1
	BVcNcIWcPlE9Af4G5XKhF73NSfve7hx8j0LmK4Tk/Vz4DFq59Mk1
X-Google-Smtp-Source: AGHT+IEf92UBwMibwLg2cnnlzn7tvqyZvwNE4RFPFPHR7sCqtNSQ5vwBs/tIcPGYoQk/X7Gw5PHdpg==
X-Received: by 2002:a05:6402:5249:b0:5c2:4c8a:a8ba with SMTP id 4fb4d7f45d1cf-5c24c8aac1amr5260276a12.8.1725317744621;
        Mon, 02 Sep 2024 15:55:44 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:bc14:b544:1196:d1a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c74184sm6040568a12.32.2024.09.02.15.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:55:44 -0700 (PDT)
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
Subject: [PATCH v1 4/7] net: smc91x: Make use of irq_get_trigger_type()
Date: Tue,  3 Sep 2024 00:55:31 +0200
Message-Id: <20240902225534.130383-5-vassilisamir@gmail.com>
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
simple irq_get_trigger_type(irq).

Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
---
 drivers/net/ethernet/smsc/smc91x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.c b/drivers/net/ethernet/smsc/smc91x.c
index 907498848028..a5e23e2da90f 100644
--- a/drivers/net/ethernet/smsc/smc91x.c
+++ b/drivers/net/ethernet/smsc/smc91x.c
@@ -2355,7 +2355,7 @@ static int smc_drv_probe(struct platform_device *pdev)
 	 * the resource supplies a trigger, override the irqflags with
 	 * the trigger flags from the resource.
 	 */
-	irq_resflags = irqd_get_trigger_type(irq_get_irq_data(ndev->irq));
+	irq_resflags = irq_get_trigger_type(ndev->irq);
 	if (irq_flags == -1 || irq_resflags & IRQF_TRIGGER_MASK)
 		irq_flags = irq_resflags & IRQF_TRIGGER_MASK;
 
-- 
2.25.1

