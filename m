Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7937F745
	for <brcm80211@lists.linux.dev>; Tue, 14 Jul 2026 02:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996158; cv=none; b=ai9bepAn4An595/8Y6UyP3qs9D+8pmJ7nxVmQPdpruIIfllFAOsJUuPBK2fnuPjww2imBVEWUGwgQRZ3TS2CHi+Qg1ytW9q1E8i3qAoSE5sysDNC/vYPEurpadtbbrmFiYk8lJK31uIp2kHBEswXQOyXBbahMNuWWy5w1uQjgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996158; c=relaxed/simple;
	bh=Ogf0c96gmvFtj7+Kg/2HQ2FnTL8f6Vlo1YUm+lu9MPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q6FHqxeBu0XvZIwHCbJoiigrC6h8xs/le1QktubPjAu834fk83UQMp6/WymMEAAuSpzm7cqXHTHetsbTmJKbfpw2QPYSebLDi4IF5YAm/1xu9Jv/79J8P+4ynp9AnKMrWnBJhB9wnEVL4U5HBuNj5YV6gzvSrbmkpUyBjDRKtRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8OFgARc; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8OFgARc"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487088510aso3605456b3a.0
        for <brcm80211@lists.linux.dev>; Mon, 13 Jul 2026 19:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783996156; x=1784600956; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5bPrUfoJACi9BYyW8xq/jkNYTvoED+3Sp0FVeU/kPo=;
        b=A8OFgARcl5HNh7hTlSFKFt8hE5nyFAguk6kg+eTMIYkmuIAN4X2Ep93p6GnGjSI8f3
         7K6HaM5lJ74AF09A+qVx1IxQN4pQNiRYqP1JtG+xua34eFdWqCbW6e/SmrSochIcXLcP
         uG8fNnSc14kgo00RsTkQWRisdKwyiVs75IDjA58AWPT4s7grVl1J0w5RAoO82mSxhvTm
         C0idFVh9PIvUv+np+BOcrQ5T3RnC2yQ8AoeN1a07PbyP9Bpe2m2EC/Vdt5T8lIo03z7E
         UyZ6sgEacs1zx9k4BmdMs0tCyT5WxWEgxKPXqe/Vx400ARr+hPO304CWEoZMFDt0NLH1
         KRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783996156; x=1784600956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5bPrUfoJACi9BYyW8xq/jkNYTvoED+3Sp0FVeU/kPo=;
        b=Em25pV3egDPfK8T2Bv0SUbVbEklmNBSEjloAtS9jn033Pk7aLeF7Kc5gb0XzGzYpLp
         dC4dYrTOCqHQoAWbKJ/DHrMfkh15gBpEh3T1nCuj6e0Mw5d8nb3E1WjopmRWjJlrZMz0
         H1DUEZF2WUAkkBRybmcrfRZ6hMpdtuaKoP1D9EE4O1ZsODxCployQzQVu6T3Gro+CFlS
         lzSM8jTl9ImNvVvtvcOyNC5SH4I6QT1ltsXG2vtHplSf22q4joOREmbL2iUDnER6boDk
         PYL3xUxdFfvinbutIr76wuab8m0oMs6gvS7VA3p6Z4Vb9qTagQSASLyJ3NjLFcyp1y2u
         /3uw==
X-Forwarded-Encrypted: i=1; AHgh+RruSB8AJqU8u0xFPW3v26xiLn5ub+JF1yepcJrYJBDweQA0g4hrvbQEy1gDFWEy3lJJTOj5jBKpEts=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9xBFZNVG1UbIOR7BKRIytNjYJh1YXTgHwa7BVvGBN9x11EVmr
	2JO0VKVfhxqWKmDdQjWlJ4msoKvmf1MWzw7KujNZc/Hb0Ba0FbPPN36W
X-Gm-Gg: AfdE7clzkt2rMtCwJTbynLea/JSwYDssVCg78pOi38ZkJS5EZlNiLzmv/MfUcq30yRz
	d7051q2nbSwnHYbzQ0oj5Mf7iS5cUlQhubbZXEgtkDWcYyCp8qKFOuOVUJSl3ezl6foLLYcdtnv
	a8EL8tKTf5QPyfujGDJyZuLorTdL801LPEnXahRlpGWaGaEtphR/kD7IsFcWdiOi+GRUbYdIpJp
	jeCgY0hEYMzmly+yUvCqKEmnlsg4j9Cd3CibrGxwQl3z9oYwewxgbjvhnu1T4CWN6CcKxIafl2x
	kOyP2AoNA6t1ERt4nm4F06H5s7VZQ+Qkkkn99rnuM9YDK2npAog7LX9BeKmt9CX/2i0CLa7vBUb
	a9wDj7cUC9mymSQNuPgm2d20Q9LMdaX+Xf1oJmKHWBmlImZm4XLkvwsA+v7nvILu6qlbBp/lhnk
	OhPOMXKwInY5unPHNvH8uYYMrDzUhhE/fOkrQ9taqy6KnqWKxSxAk6nihgdezpGj9k9Fv+TdxWW
	Z/sUuaNsY1xXBIY/veaIPSS
X-Received: by 2002:a05:6a00:4f8c:b0:848:7835:bbac with SMTP id d2e1a72fcca58-84a516307aemr1475965b3a.65.1783996156182;
        Mon, 13 Jul 2026 19:29:16 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238f75sm664039b3a.9.2026.07.13.19.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 19:29:15 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: LiangCheng Wang <zaq14760@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Angus Ainslie <angus@akkea.ca>,
	Wig Cheng <onlywig@gmail.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	wlan-kernel-dev-list@infineon.com
Subject: Re: [PATCH] wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
Date: Tue, 14 Jul 2026 10:28:59 +0800
Message-Id: <20260714022859.1849447-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <36f4388a-b856-438c-8ef4-795a7b1eda3e@broadcom.com>
References: <20260713-b43752-f2-blksz-v1-1-8697fcfeaef4@gmail.com> <36f4388a-b856-438c-8ef4-795a7b1eda3e@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arend,

On 13/07/2026 12:51, Arend van Spriel wrote:
> Looks good to me but the stable instruction looks confusion. What do you
> mean. If there is no 43752 support there is no need for this patch, right?

Thank you for the review, and thanks Gokul for the detailed
explanation - that is exactly what I meant, and sorry the annotation
was not clearer. To summarize: 43752 support has been present since
v5.15 (commit d2587c57ffd8 ("brcmfmac: add 43752 SDIO ids and
initialization")), under the SDIO_DEVICE_ID_BROADCOM_CYPRESS_43752 id
name. Commit 74e2ef72bd4b ("wifi: brcmfmac: fix 43752 SDIO FWVID
incorrectly labelled as Cypress (CYW)"), which landed in v6.18,
renamed it to SDIO_DEVICE_ID_BROADCOM_43752.

I also have to correct myself here: the boundary in the annotation
should have been "<= 6.17" rather than "<= 6.16", since the rename
only landed in v6.18. Apologies for the extra confusion.

Gokul's suggestion of cherry-picking the rename patch together with
this one into the stable trees sounds cleaner to me than editing the
id name while backporting, so I would be glad to go with that.

If it helps, I would be happy to send a v2 with the stable annotation
in the prerequisite format from
Documentation/process/stable-kernel-rules.rst:

  Cc: <stable@vger.kernel.org> # 74e2ef72bd4b: wifi: brcmfmac: fix 43752 SDIO FWVID incorrectly labelled as Cypress (CYW)

Please let me know if you would prefer that, or if the patch is fine
to take as is.

Best regards,
LiangCheng
