Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C1274FDF
	for <brcm80211@lists.linux.dev>; Fri,  7 Aug 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786123005; cv=pass; b=lcF50IpCsTDR8LvCRp0XxpqInrfwM9fI0G7R+QcGwdvfCjxCQAlv2JqUoZ2ZUkUa+sikML3VKuZAKUadC2P9wGtolz8ZTD1GLLuayetEglCjyqAHIeiefNvVtIe6FOEwKH7bgPag4tZUAvtSP1vq53M+E01RuYrhhtatPjx3gG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786123005; c=relaxed/simple;
	bh=Rtx8ZmZNm5nMH0poOJXM5HHavD/fWSB/wPvaR1ec6bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYL7NkVwqObDtev7BxtnSANbGckb2oKwkTIWaxkh58FUAPVIR9DkuWweowzDzFQQV4ydNZDgg+pmyVp9BMvEJAYdjftaCas6f3+fXefsk1kC3C+XZlEXtLCJU4FjYtKjUf+LD49go0wLYkoYIgC1hbH4KzWLNPhwoykla4eApXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvcEGznF; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvcEGznF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69edc72e513so568069a12.3
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 10:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786123002; cv=none;
        d=google.com; s=arc-20260327;
        b=V8HT1UFkzIGxHxA3gO3St/2lUf3qOyq9hmvAt7U2ye/gkh6LqXFgsLtBd4OGyDh+VG
         VVPtXGjXuetOeEEer1gEYhbOETknB4s/rTTeq1EY76+j0QgDwIkKHTUq6oqVwF/n+JNp
         TlssGjeFoTsL7eAoaxZTKGL0fFNebZPHiVKT+jk66I3OWzZhylVqWwKWyPGrOx9kRtQB
         AIXAZe86032uryTkVlm0OmiNH4uXtWgayG/7/kLdlt7tCHdocJlAAYi5abOmc4LjKO38
         LBY/vm3RLZqj8FcEjqQq2UWFwWX9huXg/TSCdwujKI/IUxQi/0BHJFoOHSsvZAfoRBNW
         vfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rtx8ZmZNm5nMH0poOJXM5HHavD/fWSB/wPvaR1ec6bI=;
        fh=yycP+JcXfP1WzPJt1v3UpPI2vfMQLCuKptaaG8OXzDk=;
        b=QtowAV57nRk7hI28/UNTMLUNFXRm73U8CXm7qx9ql7+2YdK6A1bq4l6l4Jc8UE38d2
         Hx9cvf99+xnyZWBprEQPFkLMMexFRq3dGROBm+4w29Efi+hhg5LFGAQjPYm/6yqhxeqJ
         naClqbMjpO+76kVKOpAUgptiaWsHwyf42JgWH/9Jv5GOpqRPY5Y5IwQw0fhterJswX8b
         OrJD6ghvdD7bu5zz/K9MqR0h5G4hq7NTVaa7gV9jQo6XCK7G8LocoXg2waLYqvq7HdFo
         RX1XEI+9/mBEiZHCJwv+oxRnbshbWj+Cf0H71S7xPYj30BuOqQetyO9Ssd2JAAsKVo1y
         lzeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786123002; x=1786727802; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rtx8ZmZNm5nMH0poOJXM5HHavD/fWSB/wPvaR1ec6bI=;
        b=SvcEGznFaHTv5xyw9oW2sc3Y2ULJrrzEPS8vIDIxLyW3cgOBQhxHh8NhM7L23g7+fL
         07eAjvPDNup37NJri26KoYrVwnVzUtsJegbIuGYpKdwcG8xNLKpXzYUD9/SFGXnvprVV
         qCzt1t9B/xB5GZ0wbpvwJQYYDuzseiMz1SeQ630NIiN/fLFP1uSCMLn9qrt3n9rhLGlo
         s9ZKd14kRrO2gHA0FaXBVvvYOf17Ikelx0eeb8ea30gqmPO1HbLLP3oU5FteLQtIiwNM
         4TEDu0Q0PTiNkxwdqJA6oXoOL3cUr8hauq/0OLnLu4HM/TWKpO4oLNtlSdrS7yJHvBzP
         W/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786123002; x=1786727802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rtx8ZmZNm5nMH0poOJXM5HHavD/fWSB/wPvaR1ec6bI=;
        b=oeEbQ/h94iN1X5xmQHPtCuulTSlgYclFStug8vCOUndDP5bT7HwHJ2AolMI3ZCVgu0
         5QgVSmvCSkAp2Cnvua49BpUeNurmnz8pjC5qdsNobAP80tDS/cU8LijaHMv73Y2PI2zs
         mq0NX5kIvHJVBDnPysZbsuk+QEOhBYcLvp4+1ftTgaba1rbjF7vEI1q8WY3duZaEW7k1
         Yz0rH0ZWarTohpbrvSJtpfTdh+mUZjuQ/6GDG8c6UqRb4Ov7+8yN2UfMm3kcFdYWPnT4
         xUtioHQDbtgDC4Th1IrpW+6DIbNoBf7Yi9kyXI9G7guf2WTCF8VemOPB9a5PYsmttGFQ
         XzWA==
X-Forwarded-Encrypted: i=1; AHgh+Rpdq6Zv1aazZz1jUZiIEK2JmO57/LAxDWkJpqstG0JZFHQUa0I6JedBI00dE9ksTIf0NwpfOYT+q6U=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUPdQWY9CO0ul6MzddmR0npPMp9pp40EH6y2c/jQJwZ+dCrW92
	sL5McwKdI0HmkuZUt7dAhc0pZezvPcFp0hkvcr38lb6lSf9yDapbra1n+wFiZNxhRUrSkdJ3kEE
	9YOUexpLdpOjpk2B39+NIYFs7Us0gReY=
X-Gm-Gg: AR+sD139gqxLenpNFNcq285NgXZRfiXne2V5R8mzmeDfvKFL1QkcmqMuVqN8YDy6CyN
	+xDDg8fPH9KKS8H3B7nU+cYOwmnJr29LskS6q4L8d7B4qo/4Xt5lLf6j6hC/wXJvAsk/IE5lZzf
	ReJqn6b71Aloft49n6A4yuXeg5u8CKqqESE0KHAau/5FD6xSPUzLnki/PTyGzl+wroJNLETcG0+
	DXyYj5Bxrd/p1c4YDA+4tp53r+NLSGCcStS2cWGNZnaNWwo1EYQJKf14XUZW5H2UvcZeIsELMnB
	yM/N/DwwpdXefTSsReyj2dbTmkYm5xuY77OYdB3h8kGPID951aBHO3dFbcjCoxHlCDh3OT9p1dN
	Ka6lbNs/lSQMkt5fflnXlbuLSjre3l9g5CUCHTAWX0zo=
X-Received: by 2002:a05:6402:1e8e:b0:6a0:a4f4:bca4 with SMTP id
 4fb4d7f45d1cf-6a14f07c8e2mr6612492a12.1.1786123002218; Fri, 07 Aug 2026
 10:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807163418.487508-1-bogdan.nicolae@gmail.com> <19fdd238f38.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <19fdd238f38.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Date: Fri, 7 Aug 2026 12:12:48 -0500
X-Gm-Features: AUfX_myiUNyTJjYFkszlm8txJvLhnyde7l5fcWYkuiyDB5Q-vCiwqt1JvwI0dCg
Message-ID: <CA+ORkNRRZ_qES77+12=Cx2rs_ntVqmOB0vzUtTOJddabpMvAyg@mail.gmail.com>
Subject: Re: [PATCH v6] wifi: brcmfmac: cyw: pass PMKID to firmware if present
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure!

Best,
Bogdan

On Fri, Aug 7, 2026 at 11:52=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> Op 7 augustus 2026 18:37:48 schreef Bogdan Nicolae <bogdan.nicolae@gmail.=
com>:
>
> > Zero out auth_status on initialization. Otherwise, garbage will
> > leak from the stack to the firmware (when ssid is less than 32 bytes
> > and/or when params->pmkid is set). Then, pass the params->pmkid to the
> > firmware (without it, the firmware caches a garbage PMKID on successful
> > authentication and denies a subsequent association request that include=
s
> > the PMKID).
> >
> > Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE
> > authentication in station mode")
> > Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> > Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>
> Hi Bogdan,
>
> Looks good so my Acked-by: still stands. Thanks for going with the flow.
>
> Regards,
> Arend
>
> > ---
> > v6: Fixed diff line number
> > v5: Fixed line length > 80 chars
> > v4: Fixed indentation
> > v3: Added Fixes, Cc: stable, and Acked-by tags
> > v2: Split into a separate patch
> >
> > drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
>
>
>
