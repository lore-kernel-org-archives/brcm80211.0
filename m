Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CFA3B6BF5
	for <brcm80211@lists.linux.dev>; Mon,  6 Jul 2026 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364786; cv=none; b=YmrZUjjP5Ch99LAs5+19X0bOt2MckvyvcqMbiwm92Bz3ZI4gWCra2NaSKFyzn1L+vdhJFS6rekwFdabDXGyH4PAGBKETRqQyu/kXaUHXuTXxzpBTzPCfkw6GMTrkAAMDvLUSF+Mg3NePuacH6ybGJpXFj6YDOyNXWiiyUelSsGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364786; c=relaxed/simple;
	bh=xw/k+sI/dhcgLap5T+RapTanFb/HoTDYJ0dmwehQwuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QF/pgflzVRPqfhS6P/K0xGR6UTm7X3+Pc3hLAlKD4BqRwqVZXtc4A8dzkRCUq7ijw0/SrRD/sVyigw0/m0Um5AFmksN614LIiO2VU+kfZRGOirOrr1Z2flyMOnk9+pPlUMcIwDOgOvc8BAHMiODFo+R1COZ8vKu1GoNyLnq5hBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YNqWS3b7; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YNqWS3b7"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-81086f7abaaso40125047b3.0
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 12:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364783; x=1783969583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCcqUcOAsizeBq9mZ3srg1wuiUpRLdUbtEdjrL780Fw=;
        b=C7cV+7wxcvJtD5D1+GTQkYDIG65iZEKbqudurVK3ZRq95ROwSaVeGuk72EWb+WoZF7
         85mIzgGNoIWGl0S0t3GuHzWxuVxlWaJP4V5z2Q4s3aEwIahm//h7Yy5BwYpb7cIwDD6I
         Ci/DqWbQbpPlqslzJbzXEYgHS3OCE8hdYHcg/odrCk6aiATU9pCd2ifWZX3xBRUJycag
         qONP5x/33F3lMfQOTBjtB44EZumxhr9I+2mUBuRoJXNeG1rXqKBqgxXkKJ48KqxX2STq
         xJkIhdlhdbAtGkTnynzbszSPYwscgQt3ddCxER5QmhNgtTqfIEAIqV5zOfhQCLEHEdI1
         PYUw==
X-Forwarded-Encrypted: i=1; AHgh+RrgKqEtFn86PsP12hjwzWN4p59SubQe3b5kStt31alIIMxDKc2UZEqlhamRsaFUjuQX38/K7OnQXck=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9piimMpdFZnUpcwjxFBOYZu8Ff6Mj8qkjkOuuSxxXXrKfzvo+
	25E3DzaLKnTEiDhO8MUB9GLtiUkyEsyZt8nnZ5vGDQPWKHMuZervFpeV9XqttERLK1s5BOVgeQD
	lGvtDRi7/3zAD++G9jfU2rGv/2bfWOegfFXwe6dz38Mhjj3c+mteJGUbhToXsoyoTUx/xAVUGRx
	KfAqw094dWToB1JsyRjnShhhFyTXbImbssYK2Fv72R3paP61FFssCDEi0oJUYpeNOeqiW8lZhVk
	q82cEiQNmar6owEoV+tlQ==
X-Gm-Gg: AfdE7clxh8R5WsLVwjbgz7B6bT7sOFZyijWq8Ja9VF5ysbvdbzYfqNgg+vpxMPkcUpW
	VciE4zomHEl3vrFenvoHvjbWZe/11Ach9VCX0QAKiGF5vnY+ZcMRlqF8QULW2fN7JXisMdKVzi4
	9Xeu/GgdhNbmUPy84WAsg70CixdJdP+cIkK1NJPpmHYoFZF9MUM8JyDrPyEWR0rHM2epShO100s
	tqu9IssjN59kAgCMtAxtLlQsB0r962Mu3hmpWedDvB1gKxZbTOxGDafT1o7DXARfTubF6UAzHwL
	0Db7nhPBIIYLWCjEB7HnrCTwzPowj76z1SNgbWSKlw345nQF4haX1SZ/Be75YzBFdjmtTmhMjqv
	37P/2quRrOom/etLERilfLpPTzmCG14Baga/5s7gy+armtqqZBoH3a+D3hDBdbjs203PN2fXkh8
	1sWgbaqPfqE4X8brLfiwaqx+OAfoi5FeTQppAxFlSFAZj/H5vzmSso
X-Received: by 2002:a05:690c:6103:b0:7f5:ec53:b4ce with SMTP id 00721157ae682-81be0841eeamr15370087b3.16.1783364782884;
        Mon, 06 Jul 2026 12:06:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-814449051f9sm4571637b3.0.2026.07.06.12.06.22
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:06:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so254390385a.2
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783364782; x=1783969582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCcqUcOAsizeBq9mZ3srg1wuiUpRLdUbtEdjrL780Fw=;
        b=YNqWS3b7Rougd71jbCFkIeW4Tf7e0UMhoCUuBecIyt0eohTSX46xfW+9YX9C8Qgl1e
         Kr2PWrzBd5PKVGy3xUp81bYKzttLvM91AOG/HvAmWsmuF4HLUrn8r7anqKOs+UBsRfZ6
         EFyxEbVdaCKis01Q/IJxXMqZRFLPomZnBlV2Y=
X-Forwarded-Encrypted: i=1; AHgh+RpOjXHJzx/PtTFF4/FnC+qq6Vih7Q1eLkjyvmXmj9RPZDV42owBkW/xIhgKjzFZqLbgOJ946LVwE7Q=@lists.linux.dev
X-Received: by 2002:a05:620a:6013:b0:92b:5ec7:e619 with SMTP id af79cd13be357-92ebb599704mr252260685a.52.1783364782071;
        Mon, 06 Jul 2026 12:06:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6013:b0:92b:5ec7:e619 with SMTP id af79cd13be357-92ebb599704mr252254985a.52.1783364781565;
        Mon, 06 Jul 2026 12:06:21 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800efsm964890985a.4.2026.07.06.12.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:06:20 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Bogdan Nicolae <bogdan.nicolae@acm.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] brcmfmac-cyw: clean up PMKID and cookie code
Date: Mon,  6 Jul 2026 21:06:12 +0200
Message-ID: <20260706190612.708609-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CA+ORkNQPL_qdLOSC2Ae0Y7-wihKVRaaO-DUajN-3rpjzyoEtjg@mail.gmail.com>
References: <CA+ORkNQPL_qdLOSC2Ae0Y7-wihKVRaaO-DUajN-3rpjzyoEtjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 3 Jul 2026 17:39:51 -0500, Bogdan Nicolae wrote:
> Avoid setting packet_id to cookie, which is always 0. Instead, use an
> increasing atomic counter. Avoids mismatches of completion events later
> in brcmf_notify_mgmt_tx_status, where packet_id != vif->mgmt_tx_id is
> checked.
>
> Also, zero out auth_status on initialization. Otherwise, garbage will
> leak from the stack to the firmware (when bssid is less than 32 bytes
> and/or when params->pmkid is set). Then, pass the params->pmkid to the
> firmware (without it, the firmware caches a garbage PMKID on successful
> authentication and denies a subsequent association request that includes
> the PMKID).
>
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@acm.org>

The patch failed to apply because it had line-wrapped diff lines. Please
resend. git format-patch and git send-email are your friend (well, can be).

Also, the subject line is missing the "wifi:" prefix. It should read:

  wifi: brcmfmac: cyw: clean up PMKID and cookie code

Regards,
Arend
