Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF738D3F0
	for <brcm80211@lists.linux.dev>; Mon,  3 Aug 2026 05:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785735855; cv=none; b=pbTv8hRPilaym+OK61F3LcP8RSo/L68HN6cnkbXMgrDO00obv0dJs2tk74d2KjRuO1R/r4w6Cbaewt7a+6/l5WByv61HI95mxNez0jFT0W2yxkJhBQQmxgf1DRXzoFMESSQW3A+zuq/G86kMzvbrMMMNHItsG0agqt+ynK2CYNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785735855; c=relaxed/simple;
	bh=yjB7RGHZWNCfModfSNNs6/sJuqTLBvL7I9fkLDpx6ag=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=cYVZ1UVylQzGJN+U3qrVbYB/AoyFQYtK3MqYfz3VlUlucfDTOtkUBmGw4nt4R4r4AnyQKIX+PmLDhR9D0XPvG3zJl4OvwhMjzKtjtZ2jjxUUbYgHkFHPsMMFYgZAOJY1Uaj2muPo0muvcIaDvW8577pES+aFShQ4ecg99xfyNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Mi21VHV/; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Mi21VHV/"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5bf94664327so1092870e0c.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 22:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785735852; x=1786340652;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=df1R3651GFZlufP+Sp9/jqANKcFbF/GkeE2awbI5Hgs=;
        b=HoJcBCYa8Ry5zqD42WQnuouGpqEpUbefkDR0YCc09VHaX8ka9k/w9Pjlzf2PxZJtmC
         uPjcO679Xnxh2bZmpMA/Lw+C8NGqvauqhDNwcGYhIE+Mz0aQvwLo0b3yCB7+j80fvo8o
         D8+E1GEeUuWTSbB10mg5l8FbnIV9qvlS8qNWKMnGBehYILM4CkbK6WW96cZuDIKFezkE
         RgDzngiouX9CyYKo+O0hRRmCMHMXfT5BnNgVXox8KKlaHQnjpsXFTBlP1kNJIOi37KDs
         KJ6y+8mbWKuMIuCFFO2+ZWcZniPmqtFKyVBhJj5sRKIsEAKamK5pmCzXfRX1bphP7ajU
         B85A==
X-Forwarded-Encrypted: i=1; AHgh+RppEjYVyvwKFRQyUrtXAQusacxVryIZ6hRQRnSCsRcwjq81fc8XsL3jEF3DucNwY7mTWSbYf1npHrk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbhdy5X7C4FhRaFmwvvZhCmgrU4/dLmQleR1r26Jbly2xxFtpQ
	0GzC0PUzb/X2vXuHY0XwKVaiL3jSnRxkWOX+pCXAda6eP6VYyVY7uNakRUt/21YHYQjnHXj/70J
	JEpmJLygmRYD9spMPjz+IHWLHFgvgyDwKICtKw3MXcq18GfVDox/kOVjR6ubhdynYTnQtqYxENV
	c44B3t8idVpSavAwm7sx68xTVrr6dHWueIHQ7fDVDBlYfcc1PU+6SuF+hirsFwUVx63c/jpMCF3
	28H17Oac52wmIoX63UQOw==
X-Gm-Gg: AR+sD13LfdhI+xg/mo2WpkvtHtbGaNEQbQR+rt/cxpzP5SneDV4FgUPGK845ZijB5T6
	ha+OXhC2BrRvNJGZN5xQeXLsB8QlqdRLXHLs0HnSNjc431LmP1EuAPQt4xaGcSll/mRX8FGhkUh
	Ji8VV54+JLdU0ceQ1sPqMVTBpasYByPhjBU5vhOz16KTBFuYBFyzCWsubGZY/rDEcRGHsewRTWd
	xifZaEJHSxaPmW4c3OItNMUBSzgVSsXK9gRMWd4YSYWWjsWGsvNLbCtODA89bNK3n050YmWbY6V
	6jrQZs6ZXjstqmV6GBCRqVARSAyFo85LTHIgkolsuYrblHaaOyyZbNibJStnDVS6UiEz4oJfNlo
	i/9MAIDLnYhZJxclIh4V1dfLMfW8ScdprKZs/WzADxaeM0bH8HTucrVRatY0T24eYgBqScF3ySR
	4rhXBjt29tnuGz++2bLqXpQ2aKdhZhhZnnJGEnk7s=
X-Received: by 2002:a05:6102:3f05:b0:739:d787:be8 with SMTP id ada2fe7eead31-75b23a743a9mr6046809137.9.1785735852241;
        Sun, 02 Aug 2026 22:44:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-759c9c4c6adsm720924137.28.2026.08.02.22.44.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 22:44:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c15cec1ccb6so299037566b.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 22:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785735850; x=1786340650; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=df1R3651GFZlufP+Sp9/jqANKcFbF/GkeE2awbI5Hgs=;
        b=Mi21VHV/CXkh0ypFGHZ/ZiF2W+ezoFTOq4MfMcvTsS2NwISqAZaIgEmHi9OVCzZ8FJ
         s/4NVvSwAr9f0Qfn1anx11go3cDHQRP5fvUluaBO0QBDo184uW+e5yjVtmGmUULsHfYq
         4CZN4cIsD006XH2i+vxoe14bzMvYHN3B9Jn0E=
X-Forwarded-Encrypted: i=1; AHgh+RqCE6bk3nizY3OrYdC8FMSc37Yw1ZNmUBM/8YKCfqBw23Phnpqtl1Nco75eMkXN7PihKSHqVnWXmBg=@lists.linux.dev
X-Received: by 2002:a17:906:f1cf:b0:c16:8931:245c with SMTP id a640c23a62f3a-c1fe81e1316mr455359166b.21.1785735849947;
        Sun, 02 Aug 2026 22:44:09 -0700 (PDT)
X-Received: by 2002:a17:906:f1cf:b0:c16:8931:245c with SMTP id a640c23a62f3a-c1fe81e1316mr455357966b.21.1785735849510;
        Sun, 02 Aug 2026 22:44:09 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm496563766b.54.2026.08.02.22.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 22:44:09 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>, Abdun Nihaal <nihaal@cse.iitm.ac.in>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Mon, 03 Aug 2026 07:44:08 +0200
Message-ID: <19fc626a040.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <6648c1d61a44ad732550ff20c0b1aecaa43676f6.camel@sipsolutions.net>
References: <20260722110713.115988-1-nihaal@cse.iitm.ac.in>
 <20260802083905.3819981-2-arend.vanspriel@broadcom.com>
 <e059b52701d3cad4480dfb506e61474924b9f29e.camel@sipsolutions.net>
 <6648c1d61a44ad732550ff20c0b1aecaa43676f6.camel@sipsolutions.net>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCH] wifi: brcmfmac: Fix memory leak in brcmf_sdio_read_control()
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 2 augustus 2026 18:44:40 schreef Johannes Berg <johannes@sipsolutions.net>:

> On Sun, 2026-08-02 at 18:41 +0200, Johannes Berg wrote:
>> On Sun, 2026-08-02 at 10:38 +0200, Arend van Spriel wrote:
>>> On Wed, 22 Jul 2026 16:37:12 +0530, Abdun Nihaal <nihaal@cse.iitm.ac.in> wrote:
>>>> The memory allocated for buf is not freed in some of the error paths in
>>>> brcmf_sdio_read_control(). Fix that by adding vfree() calls.
>>>>
>>>> Fixes: dd43a01c5cdb ("brcmfmac: use dynamically allocated control frame 
>>>> buffer")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
>>>> ---
>>>> Compile tested only. Issue found using static analysis.
>>>>
>>>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 3 +++
>>>> 1 file changed, 3 insertions(+)
>>>
>>> To be applied to wireless tree.
>>
>> I'm going to put this into wireless-next, at this point (-rc6) this just
>> doesn't cut it, the commit message makes it sound purely theoretical.
>
> Actually, I'm not even going to do that - sprinkling vfree()s over the
> code when moving the one that exists would be sufficient is, and I'm
> being generous here, not a good change.

Sorry, Johannes

I looked at moving the vfree() to the done: label, but the code also gets 
there in the success path to wakeup waiters. In the success path the buf is 
stored for further processing so it should not be freed. Maybe better to do:

        spin_unlock_bh(&bus->rxctl_lock);
        brcmf_sdio_dcmd_resp_wake(bus);
        return;

fail:
        vfree(buf);
        /* Awake any waiters */
        brcmf_sdio_dcmd_resp_wake(bus);
}

Gr. AvS



