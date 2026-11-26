Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703398;
	b=WYrN5nzO4iYEhRXCqPDpzlqNVxxjDHEPdUR0C063odKs7Sc/THTqQ5a/ZtQHjK3qXk0E
	 N4KZ+bpt1YP/3yJxlstItiNwHjHk9BfCGhFos+SVDQkjAB0SdQBWc4noqhfLDfVfxhKrH
	 cFUyb0d4HzHgxy9D9syq0K7Ol1K+Rc4aFHONSd4gJ8IxF4Rzmd31nWBA1wExfeypCRbKI
	 dK9MTCp50AJtFAB8XgksYNniE8+y7qMDTbZiL9JLcIE5O+akiip6n+f5R+rw0gHqR/L3v
	 /MYhH64stxG9ozCkNF3gOA/9ZOOyBjB+U5gojav5L9AZ39cZ7d0rdFf4F+Evo2wr9eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703398;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
	b=XkFmdNv1a2l7rqG2j4Fy3QKXvePwz/bwIH7QJa8yn2SV/YdE22JEu07ceOtXbk7JULgG
	 vVIyHYD0ttYN/7l3T7Zflz3yd90Wf/GhNo2dt8kVoCuTvCzh1wsW0J+vBZdvwzRV3Y5z8
	 COQXT/VOm1+xycSwUdZ3WEMa5Y6djPQIZzjM81+vXWVxEUjJSZYtfj+tzmqGu8M/UEQ+F
	 3WYWz05iMl8roU1dri+vzp1gJ9rVFLApTYjhSGsTxRWp1hFupnGR3i46rPhnfSzADln1O
	 vroBazaNFMeVC99zOoFKs+uiLrSQCrJq1r6hXlnnEPHoVM5IiqoXUqSsam8A+cJUDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LHdU5IOu;
	arc=none smtp.remote-ip=74.125.82.228
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302B606A690
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E302B606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=LHdU5IOu
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-38692f62b22so9019265eec.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703397; x=1796308197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=dY99xr+SVobpGCHFKrvN9EanPslvhqL3zcs8omovBkVySn33URPWw8gVq98tQothk5
         JJ3aU2h+BfO0/X+yFoFYZCrS/lybDvlEIT12u2Je/USfsc4RRokqDzcrpmmtV5WpLMHi
         o6btIUcseNa8zU6GU45cUYdqAu5Yi5qcemNaWLipHLLTnnB1W/7PSIK3hYA8O9L7nuAx
         lo8+2sSWDFFgOBrDlCEOhCU6xIow/hioHl4/r5+RHxH5yATbowQLiV6Eg+ufHat2sSyx
         C3PERIEYqk5Z7HaUIQPJGSjNNtKA6ZD/7LPXdZIFSu0LF3wYyqmILhw5J+wz7oizDmji
         dk6A==
X-Forwarded-Encrypted: i=1; AL+hErHox99O0D5Vo0gfBu376N3Z63N0J7b4CZK1XDXLVqNYYv90D5EtHLLt/VM5cDwqFwvdrx3LhiSc6rE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9EqKATfbah5zyXPNSQ17yjFa/SBQePnSW95ZGpSO2yM0NViKYv
	S4icHv7DwAfIL2k1t+WIoaOLrGIrx3gaeDEhWEY7ecKkaeETmzxkp2NGzquM2k0eJNz41A0jbwp
	yWOhx4gTJbf3jAKUNAMk84xUpkfva3XtvwO8Umw1ajGw8CLbreK46ka/UF0OAcsgz3NM7OsW6JS
	i3pVTgP3qV/jPLhNt+6lEn5kKt91f3v8LehNBbNJ4XEg9dGTrZtkLTVEUKWd21+hLS+FM7jENP+
	yFThMzCoOERwhaerTYAYw==
X-Gm-Gg: AZFdTZdv2N0rKeYoXMeU9OqQZyxRHG6DDR4IDrPUNWtkEJhjwbWR/4IqKmTv6klWaJL
	VlQQA/kXUXXuzIoNHls1s6FQhZ4nu0OsOLgTgvfVK59KGg6f5X0aA+SfsF/NAe6/fRCmYAwGxOm
	jpClpfhZJmd3uFxDKhyf8eho2yYzyvN9fy39MeWSp70rSpI3riKvLrrfDqqMKASF8aHSKGU5E/Y
	wB2rVnNUcLwtGgWkFvBBir9L0ZcTitj0VN/CYTaK2NIu1nInJCy+f1BDXADAp651JiiI0lrfAsL
	jnOTgjL59lrHFfyV6CgXyQv3qR9zTwiwiyyzNMAk+Ws1wKxW0bw9k6tsZmGbhl+wYVg5rEcNHjs
	xVmuPCkML0B+wmvUmYaKGz/g4jwP5jgtF+XBst2IY86X3YnbLwTH9HJQhQjhwkw56X4a8N7EnNX
	TLVTGnX8hB0Z/0BG0FEPnEr+Esqb+SYUUdyFai5qk=
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr18956576eec.20.1795703396838;
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566dd1e87sm3440103eec.11.2026.11.26.06.29.56
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536720195ebso114095271cf.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703395; x=1796308195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXNKwdPJ04JREY+aWREtcoE55TXV8m+B7lstNxSiSJ0=;
        b=LHdU5IOu2Rd2pp1Yk9522IrwZWqHKivXbFL2quSy4QiEHCdiLEZpGOjt2cVXj4RKMu
         6/Mgc7KoAjlFytzf47k09HULSQNPBrA0uwwnWxHuhkQmUWP9ZwfCkS9wXqJStddOt0SR
         OZ6G+cQT3QmrwOCR0xofDbSmmeZD7zR6q0g1g=
X-Forwarded-Encrypted: i=1; AL+hErE8KHWuGDRYekLWSnUh5nNYm6uJ7viHfbC70n3ZE4Yj1hfHPNLPtR07JjhybFAPXKZBhP6QOc9Azcs=@lists.linux.dev
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66784041cf.5.1795703395471;
        Thu, 26 Nov 2026 06:29:55 -0800 (PST)
X-Received: by 2002:ac8:5754:0:b0:535:1f5c:e489 with SMTP id d75a77b69052e-55d7690bde7mr66783611cf.5.1795703394993;
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 4/5] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Thu, 26 Nov 2026 15:29:41 +0100
Message-ID: <20261126142942.881504-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-5-dev@deq.rocks>
References: <20261111120748.23795-5-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 13:07:47 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request. brcmf_msgbuf_delete_flowring()
> waits up to 100 ms for them before it sends the request, so every
> disconnect logs a timeout, and the cleared counter goes below zero when
> the status arrives.
>
> The race the wait was added for in commit 0fa24196e425 ("wifi: brcmfmac:
> fix continuous 802.1x tx pending timeout error") is covered by
> RING_CLOSING since commit 09be7546a602 ("wifi: brcmfmac: fix scheduling
> while atomic issue when deleting flowring"), and late tx status still
> releases the packet. Send the delete right away and reset the counter
> when the ring is created.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

The race handled by 09be7546a602 is the posting side. What 0fa24196e425 also states
is that the flowring must be deleted only after all tx status is back, otherwise
pend_8021x_cnt never drains and every connection is delayed by 950 ms. Dropping the
wait is only safe if the firmware returns the tx status of the queued packets on
flowring delete, before the delete response. That was only observed on the BCM4377.
Would be good if this can be confirmed for other chips as well otherwise (probably)
better to keep the wait for those.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 ++++++++-----------
>  1 file changed, 10 insertions(+), 13 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -73,7 +73,6 @@
>  #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
>  #define BRCMF_MSGBUF_UPDATE_RX_PTR_THRS		48
>
> -#define BRCMF_MAX_TXSTATUS_WAIT_RETRIES		10
>
>  struct msgbuf_common_hdr {
>  	u8				msgtype;

This leaves two consecutive blank lines before struct msgbuf_common_hdr.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
> @@ -1471,23 +1475,16 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
>  	void *ret_ptr;
>  	u8 ifidx;
>  	int err;
> -	int retry = BRCMF_MAX_TXSTATUS_WAIT_RETRIES;
>
> -	/* make sure it is not in txflow */
> +	/*
> +	 * Make sure txflow posts nothing more to the ring. The firmware returns
> +	 * the tx status of the posted packets when it deletes the ring, before
> +	 * it sends the delete response.
> +	 */
>  	brcmf_commonring_lock(commonring_del);
>  	flow->rings[flowid]->status = RING_CLOSING;
>  	brcmf_commonring_unlock(commonring_del);
>
> -	/* wait for commonring txflow finished */
> -	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
> -		usleep_range(5000, 10000);
> -		retry--;
> -	}
> -	if (!retry) {
> -		brcmf_err("timed out waiting for txstatus\n");
> -		atomic_set(&commonring_del->outstanding_tx, 0);
> -	}
> -
>  	/* no need to submit if firmware can not be reached */
>  	if (drvr->bus_if->state != BRCMF_BUS_UP) {
>  		brcmf_dbg(MSGBUF, "bus down, flowring will be removed\n");

As said above, I do not think the wait can go for all chips on the evidence of the
BCM4377 only. I will see if I can replicate this on my 43664 device.

Regards,
Arend
