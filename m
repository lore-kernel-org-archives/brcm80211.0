Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F163914EB
	for <brcm80211@lists.linux.dev>; Sat, 27 Jun 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782562163; cv=none; b=qT4xUCkNDENI6WyeCxPcij9tGe9LHH6UKa8+QepdWwxKyOnZT3vlZZ0z9dvIhvRUH0imJ7oYwsuNO3Xf8MqKu5V8TSIQ5ikeQ3i7WXqe1M8FXbSaMRBvH76yN+kDYpseYV0HqfA1m5gaT2sIyTlaC3QnqNEY7XfULj8qW4uj2p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782562163; c=relaxed/simple;
	bh=Qz5V/qZ1e2NMwyP/pVi6BiSztUfVHSA7XJ1uHZTnzNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JP6EunElgqWjhAXf8y9yipeAP8r6iXhLpYa3P1KjnvRBzU6xAt9OdgO9fIKTDDOCOEFxHkkD0SWFHWcNOxOmhQsTbncvVWv9LtWEboG4bDUGpU1jBmuxucFgiIuKYOrVeXEjPzDwXXeLlhlJOj5zFEsQeajBslJ/gt9Kbsi1Uyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Jax9Rr78; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Jax9Rr78"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-80dc4a68e4aso504327b3.0
        for <brcm80211@lists.linux.dev>; Sat, 27 Jun 2026 05:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562161; x=1783166961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfFcnLrFbJ0cBvqWefNxS93tH3j42/SSWzQHOvhNJQg=;
        b=qp0AiheOAOaV7QvotlI1mFGq3vl5/uk62F9hETMpYAUYqzCxQb9iIZxc4ZyzlVSbdC
         uGuVkhnepwVoMBQZ6wJnah1PeUfk7/F7CpKu4EgBjeiTXDRQrI5X15fcPo8HYZiCNWTl
         DbDUrGXj+unJNuvPJcaWep4U40src6Q+Ux8OGJNBw1VXTyLPOEvh5Lq+0hHOgJIuEagw
         Ds6dILY2XHeqXpMOgGX0LF1cF+kODOOZbI7GtA/ndzgo6fEAGHL3Q/EWeMQOHk6r/WpD
         nLvOOaC+0BukH4GdBQIVmME63Q7cNlipOokqQDcEKjbOrl6tx/v2doLDSpekl797O73M
         PuXA==
X-Forwarded-Encrypted: i=1; AHgh+RpoGHGmh0yhWu2PPQInBos+m1f+/78pMKaMs2+2eJYKA6MUcHWPiLgbGH7ipK3AEk1NkUYea2bxY6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMr4tsBSuNNmkBJCp1ZvxsW11StPcA4wfR20kSxGDS7YzOwXbN
	nXUlVW4bJTZuIsF5av5FaT3y+VrwMm9n/gddVbPzBSIJCysYaj5ECOwkUETIbbVbuBCqON8gTqB
	ed131lQVmnZXpnNaGmJjDDPnHvdDzaErqDqSFjFFa0vHPRfgo6MFKsY9LBUPN1CD5oOytOokfHT
	KCykiBteb2iOBGo3w0oRBwqwVcopDq5vQCExRxsdbb7i8JsfcfcokQ0fhuP8swnM8xennCk8Tzs
	myd085uLQcX7OoMois+Ww==
X-Gm-Gg: AfdE7claNc6MX319TkcoK0GaA2ARKFTPi4ldYUt/OYuLVv6fzzyRM2U1MIcSZ1yoU1k
	zt8Z889tZ0Zp/9TtD0XVr86DEXuq31GWsaxBmgkPKMDvAKMoB8ud6sV3hrhnSSINdjVMQwLBdMl
	Xa16C3Sy1dsHYjQv5FluH3oW+UbHdyOO63CH/eo4bnwwZnVfnmcOY2VEt2WDYyi5Vo7PWcKpgq3
	fakYLvhGFGkRn8kOB+4bJOjFoxQGYD8rlLg7+Gfd+6x1g0VIXpPpeynEH9mXTg5F29vitPuwNeS
	KZoQxoVtYtASvqkvE2/R5Uz7/0q1G3xHTgKf480mRxXr/v4TJDpjzqA4hCzNjZDMkwUhYJEBZkv
	ldbJGLNDT+MsPhxpKQNKepnY/Dr/VH3S//j28LlJUowxqgZJepNA5zKKstptNMOjM7Htx50WsxW
	pDgmCotfMMGxCRB/vNNoaaez6I/0Oqwcjp3OKPLS8d96JMFFSO8w==
X-Received: by 2002:a05:690c:7241:b0:80c:85c6:898e with SMTP id 00721157ae682-80c85c68e8emr39205487b3.61.1782562161392;
        Sat, 27 Jun 2026 05:09:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-80d04762062sm710547b3.22.2026.06.27.05.09.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jun 2026 05:09:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c95b0e22aso6133944eec.1
        for <brcm80211@lists.linux.dev>; Sat, 27 Jun 2026 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1782562159; x=1783166959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nfFcnLrFbJ0cBvqWefNxS93tH3j42/SSWzQHOvhNJQg=;
        b=Jax9Rr78yX9PsR2zaVPv1WEjElGUCo8gKZ+OtTcszMGHnuMxLmIK6CubO4pY542By2
         ATQTTj41fW1QdHfxEkh/YbUT4ulxgtB7HXeRRKTY5K/eyLbgPWOrqfpGHnhPUrcpEYJn
         /zdBvyF6kFV8AHw4LQsHogpeoRr0yp3hyXCA0=
X-Forwarded-Encrypted: i=1; AHgh+Rp2thMWg5+nFjdhWjepWPtgB92sSmrw5uEuk9UTqry9kwrGgyK3PNhbaw3MfrBGEPf36W675lTBK/4=@lists.linux.dev
X-Received: by 2002:a05:7300:23cb:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-30c84dfad18mr11468875eec.23.1782562158917;
        Sat, 27 Jun 2026 05:09:18 -0700 (PDT)
X-Received: by 2002:a05:7300:23cb:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-30c84dfad18mr11468858eec.23.1782562158317;
        Sat, 27 Jun 2026 05:09:18 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9d39e7besm18507657eec.26.2026.06.27.05.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 05:09:17 -0700 (PDT)
Message-ID: <cfecc1ba-09c5-41da-b60f-c1d4da3b23e6@broadcom.com>
Date: Sat, 27 Jun 2026 14:09:15 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: brcmfmac: heap overflow in brcmf_notify_auth_frame_rx() on a
 short auth frame
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <178214417708.2368577.16740907093694208834@maoyixie.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <178214417708.2368577.16740907093694208834@maoyixie.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 22/06/2026 18:02, Maoyi Xie wrote:
> Hi all,
> 
> I think brcmf_notify_auth_frame_rx() in
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c can overflow the
> heap when the firmware reports a short external auth frame. I would
> appreciate it if you could take a look.
> 
> The handler takes the frame length from the event, then allocates a buffer
> for it.
> 
> 	u32 mgmt_frame_len = e->datalen - sizeof(struct brcmf_rx_mgmt_data);
> 	...
> 	if (e->datalen < sizeof(*rxframe)) {
> 		...
> 		return -EINVAL;
> 	}
> 	...
> 	mgmt_frame = kzalloc(mgmt_frame_len, GFP_KERNEL);
> 
> The only length check is e->datalen >= sizeof(*rxframe). So mgmt_frame_len
> can be anything from 0 up. The frame body is then copied with a length that
> subtracts the management header offset.
> 
> 	memcpy(&mgmt_frame->u, frame,
> 	       mgmt_frame_len - offsetof(struct ieee80211_mgmt, u));
> 
> offsetof(struct ieee80211_mgmt, u) is 24. If mgmt_frame_len is less than 24,
> the subtraction wraps around as an unsigned value to a huge number. The
> memcpy then runs far past the small kzalloc buffer. That is a heap overflow
> driven by the frame the firmware passes up. A malicious or malfunctioning AP
> can make the frame short during the external SAE auth exchange.
> 
> The p2p path in the same driver allocates with the header offset included,
> so it does not have this shape.
> 
> I reproduced the overflow on 7.1-rc7. With mgmt_frame_len set below the 24
> byte header offset, the subtracted length wraps to a huge value and the copy
> faults.
> 
>    BUG: unable to handle page fault ... in memcpy_orig
> 
> A check that mgmt_frame_len is at least offsetof(struct ieee80211_mgmt, u)
> before the copy would close it.
> 
> Does this look like a real bug to you, and is that the right place to bound
> it? If so I am happy to send a proper patch with a Fixes tag and Cc stable.
> 
> Kaixuan Li and I found this together.
Thanks for reaching out although it would have been fine to just send 
the patch straight away. I do agree with the assessment given so this is 
a real bug.

Regards,
Arend
