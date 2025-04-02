Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667812E3385
	for <brcm80211@lists.linux.dev>; Wed,  2 Apr 2025 02:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743560543; cv=none; b=Wor2r0FEKhq6eDlH/r2BaEpHj2MXbxzEpkwBixGJLEZR/NoFL58W51yRO5mUEP5QnflgepxIxDUv4YER8ZZw+is3oL3gudr/0y9DHsvMcblu55vE/PjOctMc2sUkiXb6GQgyAAnOayqBraxYduiJnODqiqaNQ1sT7CEEscixVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743560543; c=relaxed/simple;
	bh=Ezb0gXYiADCJFtFN0p1p0sirzr0898/9abeWN2mwekw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hyEOR8d1UrzK5I/SGk82RgRzt/h8iHzpmMdrv/wR9mKKbJaOl0iWT0mYyYJU7HjYyDMYvFFY6NzJd3MOT8D9MGm1azunBczZdKkqQ5ExHYiT4Q7sdhlQvnQT6To4bCXzhTJCkrDCtvmf+LUnMmS5x0A3XcwIfOM2MiVhuPK3KlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYqOYTlm; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYqOYTlm"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-223fd89d036so133158245ad.1
        for <brcm80211@lists.linux.dev>; Tue, 01 Apr 2025 19:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743560541; x=1744165341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MPdUgh8f/qNoFhRiTrVF2+aMX5OLujKTxRfKz1h/h8=;
        b=gYqOYTlm0PS/IFECnXM6G2tb/FKS2V181bB68aFUWDhINMf5SoXjv56OiI0nmRX9A3
         zyc13V2nfsfLSp3uCbAg/SCp/m5NFo9Xyc63/nQ3nKAunRbi59cLh9mDgcoGl9by1g+D
         Zhq1r4J9ujH4dSG9gbEFuaYyOfyPvkcL+1jBaiNV6Y01risIsl4MatJydz9rajNQVt+B
         qVIYmhPTunHlsqsleXDzZFCIcAObUtPLaNT/ca+654ChAfzhDteY2XJxbaNnz/zbbofH
         pC+IWrq7ZcoN/dymswE/Q8KY1Ie3i2o2F8scCgxwnwGCjgz03ZnzeGzbMOQILcdklmmQ
         BRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743560541; x=1744165341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MPdUgh8f/qNoFhRiTrVF2+aMX5OLujKTxRfKz1h/h8=;
        b=kq7pUxe0kdr2kYB7ZjkHT8rqzjlf+gDe0R61mGyPN6BsOzP6VZoEcjnMzaatejZXSf
         zh+8nnlBBSg7ZHmNHht6d7ONSQT38M8iIqYkmTorhR4FyCOqMLgtT7ASMYDXMgUVp77b
         tx7yYL3guIl0KAmKzeHmqftO7nzl3EYEQWywcaIZkPSZ97lj6aAOaEUhDoOuGasMDhyK
         w3qEcBWZnlqSg7peeEcxYCTIODAUkncTHlrNJQWOPN4eizi1uzH5kKiE1CfWmqiIaH8x
         ShRFNUuzd1BKlLIzI4V1ziF3ICN7HVUp2Ij6Bxsfoxk5EZUG4+nXW24dVWerOhHw6imQ
         Kv8g==
X-Forwarded-Encrypted: i=1; AJvYcCUueYOIomTyRrZJNI87ZwtiQfHaUXup9WHi2FsLlIETHDXc4XgMWMBS71do31esahHxDzhu2nXWFkI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk1KGfwf8k4oWhUMjm75HDtykhew4Y/6SKUk/jdgVAreUZl5VD
	ppUbw7f8uUlLxKjuhwElFddReSaGvUT9vUJzABdWvv3zoyySjPXm
X-Gm-Gg: ASbGncsRr89QxMnHsFxasgeH8qQd77KOdkOKz/A2jyVMbYQYRVd3w6W7nOH/sUejvU7
	SZR9GaqHQDGRtomr2F5KvMBXFDNWEIpsQINEiY2cg/LrEXLzhGI4ir4mR7am5ldaZ4RqwAuwXeD
	eIFX0l9Xucy6TTPPdCtfU2Gv1/6lV5BZjJxqmoTp79jkFM621DTg2F0MnlSFC5Zi8A9yiDPEa4F
	0s63zBHH0MNYb8HxyVZ7CB0cLVv/4fYqwc4isCFSOY0Rf0o17L4gob4UOmLyPyPuy5Ix30qX5mN
	YoKHdgW0kZyMqy2KC1VBMKbwOqgxeD0U0DZyYrf+FhW527FuDUb2YqT8gC3dz65D+8vTj5Y=
X-Google-Smtp-Source: AGHT+IGthaBJm3CXEP2yCOB9RHfLuP8APhDG0hC12B14aou92sDbgmPo84Jth75Yx54QYIPHG7/gTg==
X-Received: by 2002:a17:903:2311:b0:227:eb61:34b8 with SMTP id d9443c01a7336-2292f9777d6mr214498325ad.25.1743560541421;
        Tue, 01 Apr 2025 19:22:21 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca2cbsm97204115ad.52.2025.04.01.19.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:22:20 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: bcm: rpi: Fix NULL check after devm_kasprintf()
Date: Wed,  2 Apr 2025 10:22:15 +0800
Message-Id: <20250402022215.42834-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <195f2498f70.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <195f2498f70.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arend,  

Thank you for your thorough review and catching the return type mismatch. Upon
further investigation, I’ve confirmed that this issue was flagged by static
analysis but appears to be a false positive, as all call sites already handle
NULL checks appropriately.  

I appreciate your time and insight—please let me know if you’d like me to drop
this patch or revise it differently.  

Best regards,  
Henry Martin  
